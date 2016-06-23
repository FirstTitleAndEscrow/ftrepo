<cfparam name="url.comp_id" default=0>
<!--- <cffunction name="Is_Master" returntype="numeric">
		<!--- Supposed MASTER --->
<cfargument name="MID">
		<!--- Supposed CHILD --->
<cfargument name="N">
		<!--- Checked CHILD N should being tested first --->
    <cfset MCoID=N>
			<!--- MCoID=0 for highest level master --->
	<cfloop condition="MCoID NEQ 0">
			<!--- This query returns MasterID for MCoID (IF exists) --->
		<cfquery name="Cchild" datasource="#request.dsn#">
 			Select Master_Co_ID
 			from Companies
 			where ID = #MCoID#
		</cfquery>
		<cfif #Cchild.Master_Co_ID# eq #MID#>
				<!--- This Master ID is equal to MID --->
			<CFRETURN 1>
		<cfelse>
				<!--- Let's look for Master of this master 		 --->
            <cfset MCoID=Cchild.Master_Co_ID>
		</cfif>
	</cfloop>
			<!--- There was no master eq to MID ihn the set	 --->
	<CFRETURN 0>
</CFFUNCTION>
 --->
<cfparam name="calc" default="">
<CFSET r_count = "0">
<CFPARAM NAME="emp" DEFAULT="0">
<CFPARAM NAME="ordering_co" DEFAULT="0">





	<!---=========================================== --->
	<!--- ===/ Get a list of all of the Clients \=== --->

		<!--- <CFQUERY datasource="#request.dsn#" NAME="read_companies">

			SELECT *
			FROM companies
			ORDER BY company ASC

		</CFQUERY> --->





		<!--- <CFSET c_count = "1">
		<CFSET a_company_name = ArrayNew(1)>
		<CFSET a_company_id   = ArrayNew(1)>

		<CFOUTPUT QUERY="read_companies">
			<CFSET a_company_name[c_count] = #company#>
			<CFSET   a_company_id[c_count] = #ID#>

			<CFSET c_count = #c_count# + "1">
		</CFOUTPUT> --->

	<!---=========================================== --->
	<!---===================================================================== --->
	<!--- ===/ Use the list of companies to get a list of all their users \=== --->

		<!--- <CFSET    users_fname = ArrayNew(2)>
		<CFSET    users_lname = ArrayNew(2)>
		<CFSET       users_id = ArrayNew(2)>
		<CFSET    a_rec_count = ArrayNew(1)>

		<CFSET a_count = "1">
		<CFSET b_count = "1">

			<CFLOOP FROM="1" TO="#ArrayLen(a_company_id)#" INDEX="CCC">
				<CFQUERY datasource="#request.dsn#" NAME="read_users">
					SELECT *
					FROM users
					Where comp_id = #a_company_id[CCC]#
					ORDER BY lp_lname ASC, lp_fname ASC
				</CFQUERY>

					<CFOUTPUT QUERY="read_users">
						<CFSET users_fname[CCC][b_count] = #lp_fname#>
						<CFSET users_lname[CCC][b_count] = #lp_lname#>
						<CFSET    users_id[CCC][b_count] = #ID#>

						<CFSET b_count = #b_count# + "1">
					</CFOUTPUT>
						<CFSET a_rec_count[CCC] = #read_users.recordcount#>
						<CFSET b_count = "1">
			</CFLOOP> --->
	<!---===================================================================== --->


<CFQUERY datasource="#request.dsn#" NAME="read_date">

			SELECT oda_month
			FROM title
			ORDER BY oda_month

</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_titleid">

			SELECT title_id
			FROM title where

		<!---<cfif #url.comp_id# eq "154">
			(comp_id = 154 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 190 or comp_id = 159 or comp_id = 155 or comp_id = 168 or comp_id = 157 or comp_id = 158 or comp_id = 167 or comp_id = 170 or comp_id = 166 or comp_id = 160 or comp_id = 169 or comp_id = 161 or comp_id = 156 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 181 or comp_id = 192 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197 or comp_id = 198 or comp_id = 199 or comp_id = 200 or comp_id = 201 or comp_id = 274)
			<cfelse>
			comp_id = '#comp_id#'
			</cfif>--->

			 <cfif #url.comp_id# eq "154">
			(comp_id = 154 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 190 or comp_id = 159 or comp_id = 155 or comp_id = 168 or comp_id = 157 or comp_id = 158 or comp_id = 167 or comp_id = 170 or comp_id = 166 or comp_id = 160 or comp_id = 169 or comp_id = 161 or comp_id = 156 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 181 or comp_id = 192 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197 or comp_id = 198 or comp_id = 199 or comp_id = 200 or comp_id = 201 or comp_id = 274)
			<cfelseif #url.comp_id# eq "953">
			(comp_id = 953 or comp_id = 941 or comp_id = 942 or comp_id = 943 or comp_id = 944 or comp_id = 945 or comp_id = 946  or comp_id = 947 or comp_id = 948 or comp_id = 949 or comp_id = 950 or comp_id = 951)
			<cfelseif #comp_id# eq "1017">
			(comp_id = 1039 or comp_id = 1060 or comp_id = 968 or comp_id = 1058 or comp_id = 631 or comp_id = 635 or comp_id = 1017 or comp_id = 559  or comp_id = 859 or comp_id = 941 or comp_id = 942 or comp_id = 919 or comp_id = 953 or comp_id = 943 or comp_id = 944 or comp_id = 945 or comp_id = 946  or comp_id = 947 or comp_id = 948 or comp_id = 949 or comp_id = 950 or comp_id = 951 or comp_id = 746)

			<cfelse>
			comp_id = '#comp_id#'
			</cfif>

			<!--- <cfif is_master(url.comp_id,comp_id) neq 1>
				comp_id = '#url.comp_id#'
				<cfelse>
				1=1
			</cfif> --->

			ORDER BY Title_id

		</CFQUERY>


		<CFQUERY datasource="#request.dsn#" NAME="read_titleidclosing">

			SELECT a.title_id
			FROM title a, title_closing_order_request b
			where a.title_id = b.title_id and b.a_req_closing_day is not null
			and

			<!---<cfif #comp_id# eq "154">
			(a.comp_id = 154 or a.comp_id = 184 or a.comp_id = 185 or a.comp_id = 186 or a.comp_id = 187 or a.comp_id = 188 or a.comp_id = 189 or a.comp_id = 190 or a.comp_id = 159 or a.comp_id = 155 or a.comp_id = 168 or a.comp_id = 157 or a.comp_id = 158 or a.comp_id = 167 or a.comp_id = 170 or a.comp_id = 166 or a.comp_id = 160 or a.comp_id = 169 or a.comp_id = 161 or a.comp_id = 156 or a.comp_id = 162 or a.comp_id = 163 or a.comp_id = 164 or a.comp_id = 165 or a.comp_id = 181 or a.comp_id = 192 or a.comp_id = 193 or a.comp_id = 194 or a.comp_id = 195 or a.comp_id = 196 or a.comp_id = 197 or a.comp_id = 198 or a.comp_id = 199 or a.comp_id = 200 or a.comp_id = 201 or a.comp_id = 274)
			<cfelse>
			a.comp_id = '#comp_id#'
			</cfif>--->
			<!--- <cfif is_master(url.comp_id,comp_id) neq 1>
				comp_id = '#url.comp_id#'
			<cfelse>
				1=1
			</cfif> --->

			 <cfif #comp_id# eq "154">
			(comp_id = 154 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 190 or comp_id = 159 or comp_id = 155 or comp_id = 168 or comp_id = 157 or comp_id = 158 or comp_id = 167 or comp_id = 170 or comp_id = 166 or comp_id = 160 or comp_id = 169 or comp_id = 161 or comp_id = 156 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 181 or comp_id = 192 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197 or comp_id = 198 or comp_id = 199 or comp_id = 200 or comp_id = 201 or comp_id = 274)
			<cfelseif #comp_id# eq "953">
			(comp_id = 953 or comp_id = 941 or comp_id = 942 or comp_id = 943 or comp_id = 944 or comp_id = 945 or comp_id = 946  or comp_id = 947 or comp_id = 948 or comp_id = 949 or comp_id = 950 or comp_id = 951)

				<cfelseif #comp_id# eq "1017">
			(comp_id = 1039 or comp_id = 1060 or comp_id = 968 or comp_id = 1058 or comp_id = 631 or comp_id = 635 or comp_id = 1017 or comp_id = 559  or comp_id = 859 or comp_id = 941 or comp_id = 942 or comp_id = 919 or comp_id = 953 or comp_id = 943 or comp_id = 944 or comp_id = 945 or comp_id = 946  or comp_id = 947 or comp_id = 948 or comp_id = 949 or comp_id = 950 or comp_id = 951 or comp_id = 746)


			<cfelse>
			comp_id = '#comp_id#'
			</cfif>

			ORDER BY a.Title_id

		</CFQUERY>


<CFQUERY datasource="#request.dsn#" NAME="read_date">

			SELECT oda_month, title_id
			FROM title
			ORDER BY oda_month, Title_id

		</CFQUERY>


<CFQUERY datasource="#request.dsn#" NAME="read_Comments">

			SELECT DISTINCT comments
			FROM title
			ORDER BY comments

		</CFQUERY>






	<CFQUERY datasource="#request.dsn#" NAME="read_date_p">

			SELECT oda_month
			FROM property
			ORDER BY oda_month

</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_titleid_p">

			SELECT prop_id
			FROM property where

		<!---	<cfif #comp_id# eq "154">
			(comp_id = 154 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 190 or comp_id = 159 or comp_id = 155 or comp_id = 168 or comp_id = 157 or comp_id = 158 or comp_id = 167 or comp_id = 170 or comp_id = 166 or comp_id = 160 or comp_id = 169 or comp_id = 161 or comp_id = 156 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 181 or comp_id = 192 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197 or comp_id = 198 or comp_id = 199 or comp_id = 200 or comp_id = 201 or comp_id = 274)
			<cfelse>
			comp_id = '#comp_id#'
			</cfif>--->

			 <cfif #comp_id# eq "154">
			(comp_id = 154 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 190 or comp_id = 159 or comp_id = 155 or comp_id = 168 or comp_id = 157 or comp_id = 158 or comp_id = 167 or comp_id = 170 or comp_id = 166 or comp_id = 160 or comp_id = 169 or comp_id = 161 or comp_id = 156 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 181 or comp_id = 192 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197 or comp_id = 198 or comp_id = 199 or comp_id = 200 or comp_id = 201 or comp_id = 274)
			<cfelseif #comp_id# eq "953">
			(comp_id = 953 or comp_id = 941 or comp_id = 942 or comp_id = 943 or comp_id = 944 or comp_id = 945 or comp_id = 946  or comp_id = 947 or comp_id = 948 or comp_id = 949 or comp_id = 950 or comp_id = 951)

				<cfelseif #comp_id# eq "1017">
			(comp_id = 1039 or comp_id = 1060 or comp_id = 968 or comp_id = 1058 or comp_id = 631 or comp_id = 635 or comp_id = 1017 or comp_id = 559  or comp_id = 859 or comp_id = 941 or comp_id = 942 or comp_id = 919 or comp_id = 953 or comp_id = 943 or comp_id = 944 or comp_id = 945 or comp_id = 946  or comp_id = 947 or comp_id = 948 or comp_id = 949 or comp_id = 950 or comp_id = 951 or comp_id = 746)

			<cfelse>
			comp_id = '#comp_id#'
			</cfif>

			ORDER BY prop_id

		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_titleid_a">

			SELECT app_id
			FROM appraisal where
			<!---<cfif #comp_id# eq "154">
			(comp_id = 154 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 190 or comp_id = 159 or comp_id = 155 or comp_id = 168 or comp_id = 157 or comp_id = 158 or comp_id = 167 or comp_id = 170 or comp_id = 166 or comp_id = 160 or comp_id = 169 or comp_id = 161 or comp_id = 156 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 181 or comp_id = 192 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197 or comp_id = 198 or comp_id = 199 or comp_id = 200 or comp_id = 201 or comp_id = 274)
			<cfelse>
			comp_id = '#comp_id#'
			</cfif>--->

			 <cfif #comp_id# eq "154">
			(comp_id = 154 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 190 or comp_id = 159 or comp_id = 155 or comp_id = 168 or comp_id = 157 or comp_id = 158 or comp_id = 167 or comp_id = 170 or comp_id = 166 or comp_id = 160 or comp_id = 169 or comp_id = 161 or comp_id = 156 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 181 or comp_id = 192 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197 or comp_id = 198 or comp_id = 199 or comp_id = 200 or comp_id = 201 or comp_id = 274)
			<cfelseif #comp_id# eq "953">
			(comp_id = 953 or comp_id = 941 or comp_id = 942 or comp_id = 943 or comp_id = 944 or comp_id = 945 or comp_id = 946  or comp_id = 947 or comp_id = 948 or comp_id = 949 or comp_id = 950 or comp_id = 951)

				<cfelseif #comp_id# eq "1017">
			(comp_id = 1039 or comp_id = 1060 or comp_id = 968 or comp_id = 1058 or comp_id = 631 or comp_id = 635 or comp_id = 1017 or comp_id = 559  or comp_id = 859 or comp_id = 941 or comp_id = 942 or comp_id = 919 or comp_id = 953 or comp_id = 943 or comp_id = 944 or comp_id = 945 or comp_id = 946  or comp_id = 947 or comp_id = 948 or comp_id = 949 or comp_id = 950 or comp_id = 951 or comp_id = 746)



			<cfelse>
			comp_id = '#comp_id#'
			</cfif>
			ORDER BY app_id

		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_titleid_anc">

			SELECT anc_id
			FROM ancillary where codeFlood is not null

			<!---<cfif #comp_id# eq "154">
			and (comp_id = 154 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 190 or comp_id = 159 or comp_id = 155 or comp_id = 168 or comp_id = 157 or comp_id = 158 or comp_id = 167 or comp_id = 170 or comp_id = 166 or comp_id = 160 or comp_id = 169 or comp_id = 161 or comp_id = 156 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 181 or comp_id = 192 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197 or comp_id = 198 or comp_id = 199 or comp_id = 200 or comp_id = 201 or comp_id = 274)
			<cfelse>
			and comp_id = '#comp_id#'
			</cfif>--->

			 <cfif #comp_id# eq "154">
			and (comp_id = 154 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 190 or comp_id = 159 or comp_id = 155 or comp_id = 168 or comp_id = 157 or comp_id = 158 or comp_id = 167 or comp_id = 170 or comp_id = 166 or comp_id = 160 or comp_id = 169 or comp_id = 161 or comp_id = 156 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 181 or comp_id = 192 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197 or comp_id = 198 or comp_id = 199 or comp_id = 200 or comp_id = 201 or comp_id = 274)
			<cfelseif #comp_id# eq "953">
			and (comp_id = 953 or comp_id = 941 or comp_id = 942 or comp_id = 943 or comp_id = 944 or comp_id = 945 or comp_id = 946  or comp_id = 947 or comp_id = 948 or comp_id = 949 or comp_id = 950 or comp_id = 951)
			<cfelseif #comp_id# eq "1017">
			(comp_id = 1039 or comp_id = 1060 or comp_id = 968 or comp_id = 1058 or comp_id = 631 or comp_id = 635 or comp_id = 1017 or comp_id = 559  or comp_id = 859 or comp_id = 941 or comp_id = 942 or comp_id = 919 or comp_id = 953 or comp_id = 943 or comp_id = 944 or comp_id = 945 or comp_id = 946  or comp_id = 947 or comp_id = 948 or comp_id = 949 or comp_id = 950 or comp_id = 951 or comp_id = 746)


			<cfelse>
			and comp_id = '#comp_id#'
			</cfif>

			ORDER BY anc_id

		</CFQUERY>
				<CFQUERY datasource="#request.dsn#" NAME="read_titleid_cr">

			SELECT anc_id
			FROM ancillary where codeCR is not null and
			<!---<cfif #comp_id# eq "154">
			(comp_id = 154 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 190 or comp_id = 159 or comp_id = 155 or comp_id = 168 or comp_id = 157 or comp_id = 158 or comp_id = 167 or comp_id = 170 or comp_id = 166 or comp_id = 160 or comp_id = 169 or comp_id = 161 or comp_id = 156 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 181 or comp_id = 192 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197 or comp_id = 198 or comp_id = 199 or comp_id = 200 or comp_id = 201 or comp_id = 274)
			<cfelse>
			comp_id = '#comp_id#'
			</cfif>--->

			 <cfif #comp_id# eq "154">
			(comp_id = 154 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 190 or comp_id = 159 or comp_id = 155 or comp_id = 168 or comp_id = 157 or comp_id = 158 or comp_id = 167 or comp_id = 170 or comp_id = 166 or comp_id = 160 or comp_id = 169 or comp_id = 161 or comp_id = 156 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 181 or comp_id = 192 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197 or comp_id = 198 or comp_id = 199 or comp_id = 200 or comp_id = 201 or comp_id = 274)
			<cfelseif #comp_id# eq "953">
			(comp_id = 953 or comp_id = 941 or comp_id = 942 or comp_id = 943 or comp_id = 944 or comp_id = 945 or comp_id = 946  or comp_id = 947 or comp_id = 948 or comp_id = 949 or comp_id = 950 or comp_id = 951)
			<cfelseif #comp_id# eq "1017">
			(comp_id = 1039 or comp_id = 1060 or comp_id = 968 or comp_id = 1058 or comp_id = 631 or comp_id = 635 or comp_id = 1017 or comp_id = 559  or comp_id = 859 or comp_id = 941 or comp_id = 942 or comp_id = 919 or comp_id = 953 or comp_id = 943 or comp_id = 944 or comp_id = 945 or comp_id = 946  or comp_id = 947 or comp_id = 948 or comp_id = 949 or comp_id = 950 or comp_id = 951 or comp_id = 746)


			<cfelse>
			comp_id = '#comp_id#'
			</cfif>
			ORDER BY anc_id

		</CFQUERY>
				<CFQUERY datasource="#request.dsn#" NAME="read_titleid_avm">

			SELECT anc_id
			FROM ancillary where codeAVM is not null and
		<!---	<cfif #comp_id# eq "154">
			(comp_id = 154 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 190 or comp_id = 159 or comp_id = 155 or comp_id = 168 or comp_id = 157 or comp_id = 158 or comp_id = 167 or comp_id = 170 or comp_id = 166 or comp_id = 160 or comp_id = 169 or comp_id = 161 or comp_id = 156 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 181 or comp_id = 192 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197 or comp_id = 198 or comp_id = 199 or comp_id = 200 or comp_id = 201 or comp_id = 274)
			<cfelse>
			comp_id = '#comp_id#'
			</cfif>--->
			  <cfif #comp_id# eq "154">
			(comp_id = 154 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 190 or comp_id = 159 or comp_id = 155 or comp_id = 168 or comp_id = 157 or comp_id = 158 or comp_id = 167 or comp_id = 170 or comp_id = 166 or comp_id = 160 or comp_id = 169 or comp_id = 161 or comp_id = 156 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 181 or comp_id = 192 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197 or comp_id = 198 or comp_id = 199 or comp_id = 200 or comp_id = 201 or comp_id = 274)
			<cfelseif #comp_id# eq "953">
			(comp_id = 953 or comp_id = 941 or comp_id = 942 or comp_id = 943 or comp_id = 944 or comp_id = 945 or comp_id = 946  or comp_id = 947 or comp_id = 948 or comp_id = 949 or comp_id = 950 or comp_id = 951)
			<cfelseif #comp_id# eq "1017">
			(comp_id = 1039 or comp_id = 1060 or comp_id = 968 or comp_id = 1058 or comp_id = 631 or comp_id = 635 or comp_id = 1017 or comp_id = 559  or comp_id = 859 or comp_id = 941 or comp_id = 942 or comp_id = 919 or comp_id = 953 or comp_id = 943 or comp_id = 944 or comp_id = 945 or comp_id = 946  or comp_id = 947 or comp_id = 948 or comp_id = 949 or comp_id = 950 or comp_id = 951 or comp_id = 746)


			<cfelse>
			comp_id = '#comp_id#'
			</cfif>
			ORDER BY anc_id

		</CFQUERY>
				<CFQUERY datasource="#request.dsn#" NAME="read_titleid_sn">

			SELECT anc_id
			FROM ancillary where codeSigning is not null and
			<!--- <cfif #comp_id# eq "154">
			(comp_id = 154 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 190 or comp_id = 159 or comp_id = 155 or comp_id = 168 or comp_id = 157 or comp_id = 158 or comp_id = 167 or comp_id = 170 or comp_id = 166 or comp_id = 160 or comp_id = 169 or comp_id = 161 or comp_id = 156 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 181 or comp_id = 192 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197 or comp_id = 198 or comp_id = 199 or comp_id = 200 or comp_id = 201 or comp_id = 274)
			<cfelse>
			comp_id = '#comp_id#'
			</cfif>--->
			 <cfif #comp_id# eq "154">
			(comp_id = 154 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 190 or comp_id = 159 or comp_id = 155 or comp_id = 168 or comp_id = 157 or comp_id = 158 or comp_id = 167 or comp_id = 170 or comp_id = 166 or comp_id = 160 or comp_id = 169 or comp_id = 161 or comp_id = 156 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 181 or comp_id = 192 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197 or comp_id = 198 or comp_id = 199 or comp_id = 200 or comp_id = 201 or comp_id = 274)
			<cfelseif #comp_id# eq "953">
			(comp_id = 953 or comp_id = 941 or comp_id = 942 or comp_id = 943 or comp_id = 944 or comp_id = 945 or comp_id = 946  or comp_id = 947 or comp_id = 948 or comp_id = 949 or comp_id = 950 or comp_id = 951)
			<cfelseif #comp_id# eq "1017">
			(comp_id = 1039 or comp_id = 1060 or comp_id = 968 or comp_id = 1058 or comp_id = 631 or comp_id = 635 or comp_id = 1017 or comp_id = 559  or comp_id = 859 or comp_id = 941 or comp_id = 942 or comp_id = 919 or comp_id = 953 or comp_id = 943 or comp_id = 944 or comp_id = 945 or comp_id = 946  or comp_id = 947 or comp_id = 948 or comp_id = 949 or comp_id = 950 or comp_id = 951 or comp_id = 746)


			<cfelse>
			comp_id = '#comp_id#'
			</cfif>
			ORDER BY anc_id

		</CFQUERY>
		
		
		
		
		
				<CFQUERY datasource="#request.dsn#" NAME="read_titleid_fdr">

			SELECT fdr_id
			FROM final_document_retrieval where 
			<!--- <cfif #comp_id# eq "154">
			(comp_id = 154 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 190 or comp_id = 159 or comp_id = 155 or comp_id = 168 or comp_id = 157 or comp_id = 158 or comp_id = 167 or comp_id = 170 or comp_id = 166 or comp_id = 160 or comp_id = 169 or comp_id = 161 or comp_id = 156 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 181 or comp_id = 192 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197 or comp_id = 198 or comp_id = 199 or comp_id = 200 or comp_id = 201 or comp_id = 274)
			<cfelse>
			comp_id = '#comp_id#'
			</cfif>--->
			 <cfif #comp_id# eq "154">
			(comp_id = 154 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 190 or comp_id = 159 or comp_id = 155 or comp_id = 168 or comp_id = 157 or comp_id = 158 or comp_id = 167 or comp_id = 170 or comp_id = 166 or comp_id = 160 or comp_id = 169 or comp_id = 161 or comp_id = 156 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 181 or comp_id = 192 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197 or comp_id = 198 or comp_id = 199 or comp_id = 200 or comp_id = 201 or comp_id = 274)
			<cfelseif #comp_id# eq "953">
			(comp_id = 953 or comp_id = 941 or comp_id = 942 or comp_id = 943 or comp_id = 944 or comp_id = 945 or comp_id = 946  or comp_id = 947 or comp_id = 948 or comp_id = 949 or comp_id = 950 or comp_id = 951)
			<cfelseif #comp_id# eq "1017">
			(comp_id = 1039 or comp_id = 1060 or comp_id = 968 or comp_id = 1058 or comp_id = 631 or comp_id = 635 or comp_id = 1017 or comp_id = 559  or comp_id = 859 or comp_id = 941 or comp_id = 942 or comp_id = 919 or comp_id = 953 or comp_id = 943 or comp_id = 944 or comp_id = 945 or comp_id = 946  or comp_id = 947 or comp_id = 948 or comp_id = 949 or comp_id = 950 or comp_id = 951 or comp_id = 746)


			<cfelse>
			comp_id = '#comp_id#'
			</cfif>
			ORDER BY fdr_id

		</CFQUERY>
		
		
		
				<CFQUERY datasource="#request.dsn#" NAME="read_titleid_pr">

			SELECT pr_id
			FROM Policy_Recovery where 
			<!--- <cfif #comp_id# eq "154">
			(comp_id = 154 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 190 or comp_id = 159 or comp_id = 155 or comp_id = 168 or comp_id = 157 or comp_id = 158 or comp_id = 167 or comp_id = 170 or comp_id = 166 or comp_id = 160 or comp_id = 169 or comp_id = 161 or comp_id = 156 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 181 or comp_id = 192 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197 or comp_id = 198 or comp_id = 199 or comp_id = 200 or comp_id = 201 or comp_id = 274)
			<cfelse>
			comp_id = '#comp_id#'
			</cfif>--->
			 <cfif #comp_id# eq "154">
			(comp_id = 154 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 190 or comp_id = 159 or comp_id = 155 or comp_id = 168 or comp_id = 157 or comp_id = 158 or comp_id = 167 or comp_id = 170 or comp_id = 166 or comp_id = 160 or comp_id = 169 or comp_id = 161 or comp_id = 156 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 181 or comp_id = 192 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197 or comp_id = 198 or comp_id = 199 or comp_id = 200 or comp_id = 201 or comp_id = 274)
			<cfelseif #comp_id# eq "953">
			(comp_id = 953 or comp_id = 941 or comp_id = 942 or comp_id = 943 or comp_id = 944 or comp_id = 945 or comp_id = 946  or comp_id = 947 or comp_id = 948 or comp_id = 949 or comp_id = 950 or comp_id = 951)
			<cfelseif #comp_id# eq "1017">
			(comp_id = 1039 or comp_id = 1060 or comp_id = 968 or comp_id = 1058 or comp_id = 631 or comp_id = 635 or comp_id = 1017 or comp_id = 559  or comp_id = 859 or comp_id = 941 or comp_id = 942 or comp_id = 919 or comp_id = 953 or comp_id = 943 or comp_id = 944 or comp_id = 945 or comp_id = 946  or comp_id = 947 or comp_id = 948 or comp_id = 949 or comp_id = 950 or comp_id = 951 or comp_id = 746)


			<cfelse>
			comp_id = '#comp_id#'
			</cfif>
			ORDER BY pr_id

		</CFQUERY>
		
		
		
<CFQUERY datasource="#request.dsn#" NAME="read_date_p">

			SELECT oda_month, prop_id
			FROM property where
		<!--- 	<cfif #comp_id# eq "154">
			(comp_id = 154 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 190 or comp_id = 159 or comp_id = 155 or comp_id = 168 or comp_id = 157 or comp_id = 158 or comp_id = 167 or comp_id = 170 or comp_id = 166 or comp_id = 160 or comp_id = 169 or comp_id = 161 or comp_id = 156 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 181 or comp_id = 192 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197 or comp_id = 198 or comp_id = 199 or comp_id = 200 or comp_id = 201 or comp_id = 274)
			<cfelse>
			comp_id = '#comp_id#'
			</cfif>--->
			 <cfif #comp_id# eq "154">
			(comp_id = 154 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 190 or comp_id = 159 or comp_id = 155 or comp_id = 168 or comp_id = 157 or comp_id = 158 or comp_id = 167 or comp_id = 170 or comp_id = 166 or comp_id = 160 or comp_id = 169 or comp_id = 161 or comp_id = 156 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 181 or comp_id = 192 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197 or comp_id = 198 or comp_id = 199 or comp_id = 200 or comp_id = 201 or comp_id = 274)
			<cfelseif #comp_id# eq "953">
			(comp_id = 953 or comp_id = 941 or comp_id = 942 or comp_id = 943 or comp_id = 944 or comp_id = 945 or comp_id = 946  or comp_id = 947 or comp_id = 948 or comp_id = 949 or comp_id = 950 or comp_id = 951)
		<cfelseif #comp_id# eq "1017">
			(comp_id = 1039 or comp_id = 1060 or comp_id = 968 or comp_id = 1058 or comp_id = 631 or comp_id = 635 or comp_id = 1017 or comp_id = 559  or comp_id = 859 or comp_id = 941 or comp_id = 942 or comp_id = 919 or comp_id = 953 or comp_id = 943 or comp_id = 944 or comp_id = 945 or comp_id = 946  or comp_id = 947 or comp_id = 948 or comp_id = 949 or comp_id = 950 or comp_id = 951 or comp_id = 746)


			<cfelse>
			comp_id = '#comp_id#'
			</cfif>
			ORDER BY oda_month, prop_id

		</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_company">
    SELECT *
    FROM companies
    WHERE ID = '#comp_id#'
    ORDER BY company ASC
</CFQUERY>
<cfif #read_company.recordcount# GT 0>
    <CFIF #read_company.companies_switch# eq "1">
        <CFQUERY datasource="#request.dsn#" NAME="read_company_user">
            SELECT *
            FROM Companies_user
            WHERE id = #emp#
        </CFQUERY>

        <CFSET emp = #read_company_user.id#>
    </cfif>
</CFIF>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>
<STYLE TYPE="text/css">
body {background-attachment:fixed;scrollbar-base-color:#708090}
.menu1 {color:#000000;font:normal bold 11px helvetica, geneva, sans serif;text-align:center;font-color:#000000}
.menu1:link    {text-decoration:none;color:#000000;font:normal bold 11px helvetica, geneva, sans serif;}
.menu1:visited {text-decoration:none;color:#000000;font:normal bold 11px helvetica, geneva, sans serif;}
.menu1:hover   {font:normal bold 11px helvetica, geneva, sans serif;text-decoration:none;color:#FFFFFF}
</style>
<script type="text/javascript">
function prodSelect() {
var frm;
frm = document.frm;


if (frm.product.value == 'appraisal') {
location.href="./title_client_rep_view.cfm?emp=<cfoutput>#emp#</cfoutput>&comp_id=<cfoutput>#comp_id#</cfoutput>&user_id_1=<cfoutput>#USER_ID_1#</cfoutput>&lo_id=<cfoutput>#lo_id#</cfoutput>&a_trigger=3&company_id=0&ordering_co=<cfoutput>#ordering_co#</cfoutput>";
  }
else if (frm.product.value == 'property') {
location.href="./title_client_rep_view.cfm?emp=<cfoutput>#emp#</cfoutput>&comp_id=<cfoutput>#comp_id#</cfoutput>&user_id_1=<cfoutput>#USER_ID_1#</cfoutput>&lo_id=<cfoutput>#lo_id#</cfoutput>&a_trigger=2&company_id=0&ordering_co=<cfoutput>#ordering_co#</cfoutput>";

}
else if (frm.product.value == 'title') {
location.href="./title_client_rep_view.cfm?emp=<cfoutput>#emp#</cfoutput>&comp_id=<cfoutput>#comp_id#</cfoutput>&user_id_1=<cfoutput>#USER_ID_1#</cfoutput>&lo_id=<cfoutput>#lo_id#</cfoutput>&a_trigger=1&company_id=0&ordering_co=<cfoutput>#ordering_co#</cfoutput>";

}

else if (frm.product.value == 'flood') {
location.href="./title_client_rep_view.cfm?emp=<cfoutput>#emp#</cfoutput>&comp_id=<cfoutput>#comp_id#</cfoutput>&user_id_1=<cfoutput>#USER_ID_1#</cfoutput>&lo_id=<cfoutput>#lo_id#</cfoutput>&a_trigger=4&company_id=0&ordering_co=<cfoutput>#ordering_co#</cfoutput>";

}


else if (frm.product.value == 'credit') {
location.href="./title_client_rep_view.cfm?emp=<cfoutput>#emp#</cfoutput>&comp_id=<cfoutput>#comp_id#</cfoutput>&user_id_1=<cfoutput>#USER_ID_1#</cfoutput>&lo_id=<cfoutput>#lo_id#</cfoutput>&a_trigger=5&company_id=0&ordering_co=<cfoutput>#ordering_co#</cfoutput>";

}
else if (frm.product.value == 'avm') {
location.href="./title_client_rep_view.cfm?emp=<cfoutput>#emp#</cfoutput>&comp_id=<cfoutput>#comp_id#</cfoutput>&user_id_1=<cfoutput>#USER_ID_1#</cfoutput>&lo_id=<cfoutput>#lo_id#</cfoutput>&a_trigger=6&company_id=0&ordering_co=<cfoutput>#ordering_co#</cfoutput>";

}
else if (frm.product.value == 'signing') {
location.href="./title_client_rep_view.cfm?emp=<cfoutput>#emp#</cfoutput>&comp_id=<cfoutput>#comp_id#</cfoutput>&user_id_1=<cfoutput>#USER_ID_1#</cfoutput>&lo_id=<cfoutput>#lo_id#</cfoutput>&a_trigger=7&company_id=0&ordering_co=<cfoutput>#ordering_co#</cfoutput>";

}

else if (frm.product.value == 'final_document_retrieval') {
location.href="./title_client_rep_view.cfm?emp=<cfoutput>#emp#</cfoutput>&comp_id=<cfoutput>#comp_id#</cfoutput>&user_id_1=<cfoutput>#USER_ID_1#</cfoutput>&lo_id=<cfoutput>#lo_id#</cfoutput>&a_trigger=10&company_id=0&ordering_co=<cfoutput>#ordering_co#</cfoutput>";

}

else if (frm.product.value == 'policy_recovery') {
location.href="./title_client_rep_view.cfm?emp=<cfoutput>#emp#</cfoutput>&comp_id=<cfoutput>#comp_id#</cfoutput>&user_id_1=<cfoutput>#USER_ID_1#</cfoutput>&lo_id=<cfoutput>#lo_id#</cfoutput>&a_trigger=11&company_id=0&ordering_co=<cfoutput>#ordering_co#</cfoutput>";

}

else  if (frm.product.value == 'all') {

 location.href="./title_client_rep_view.cfm?emp=<cfoutput>#emp#</cfoutput>&comp_id=<cfoutput>#comp_id#</cfoutput>&user_id_1=<cfoutput>#USER_ID_1#</cfoutput>&lo_id=<cfoutput>#lo_id#</cfoutput>&a_trigger=8&company_id=0&ordering_co=<cfoutput>#ordering_co#</cfoutput>";
} else {
location.href="./title_client_rep_view.cfm?emp=<cfoutput>#emp#</cfoutput>&comp_id=<cfoutput>#comp_id#</cfoutput>&user_id_1=<cfoutput>#USER_ID_1#</cfoutput>&lo_id=<cfoutput>#lo_id#</cfoutput>&a_trigger=9&company_id=0&ordering_co=<cfoutput>#ordering_co#</cfoutput>";

}
}
</script>
<script type="text/javascript">
function monthresult() {
var frm;
frm = document.frm;


if (frm.confirm_mon.value != 'Month') {

  frm.confirm_mon_to.value = frm.confirm_mon.options[frm.confirm_mon.selectedIndex].value;

}
}

</script>
<script type="text/javascript">
function dayresult() {
var frm;
frm = document.frm;
if (frm.comfirm_day.value != 'Day') {
 frm.comfirm_day_to.value = frm.comfirm_day.options[frm.comfirm_day.selectedIndex].value;
}
}
</script>
<script type="text/javascript">
function yearresult() {
var frm;
frm = document.frm;
if (frm.confirm_year.value != 'Year') {

frm.confirm_year_to.value = frm.confirm_year.options[frm.confirm_year.selectedIndex].value;
}
}

</script>
<script type="text/javascript">
function stateSelect() {
var frm;
frm = document.frm;


  frm.state.options[0].selected = false;


}

</script>
</head>

<BODY BGCOLOR="FFFFFF" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER>
<table width=780 border="0" cellpadding="0" cellspacing="0" background="./images/back_03.gif">
  <TBODY>
   <tr>
  <td align = "center">

<table width="770" height="110" border=0 cellpadding=0 cellspacing=0 background="/client/images/banner_black_wout_logo.jpg" valign=top>
  <tr>
    <td rowspan="2" valign="top" width="220"><cfinclude template="logo_swap_include.cfm"></td>
    <td valign="top" align="right"><br>

	<cfFORM NAME="Search" METHOD="post" ACTION="title_client_single_display.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&ordering_co=#ordering_co#">

	<table border=0 align="right" cellpadding="0" cellspacing=0>
              <tr>
                <td align="right" valign="center"><a href="./quicksearchhelp.cfm" target="quicksearch" onClick="window.open('','quicksearch','width=320,height=170,status=0,resizable=0,scrollbars=0')"><font size=2 color=red face=arial>Quick Search</font></a> &nbsp;&nbsp;</td>
                <td align="right" valign="center"><input type="text" name="number" size=10></td>
                <td align="right" valign="center">&nbsp;
                  <input type="image" src="/client/images/searchgo.jpg" border=0 alt="Begin your Web search"></td>
              </tr><tr><td align="right" valign="center" colspan="3"><font size="-2" color="white" face="Arial"><strong>Type in Buyer's last name,Order ID or Property Address</strong>&nbsp;&nbsp;&nbsp;</font></td>
  </tr></table>
 </cfFORM>
</td>
  </tr>
  <tr>
    <td valign="top" align="center" width="560"><nobr></nobr><br>
      &nbsp;</td>
  </tr>
</table>


</td></tr></tbody></table>

<table width=780 border="0" cellpadding="0" cellspacing="0" background="./images/back_03.gif">
  <TBODY>
   <tr>
  <td>
<center>
<table cellpadding="1" cellspacing="1" bgcolor = "000000" border="0" valign="top" width="770" height="25">
		<center>
		<!--- <td width="95" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		 --->    <CFOUTPUT><TR>
		 <td valign="middle" align = "center" width="95"  height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FECE62'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./contact_team.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#&ordering_co=#ordering_co#';return false;"><a class="menu1" href="./contact_team.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#&ordering_co=#ordering_co#"><nobr><img src="/client/images/arrowlogin.jpg" border=0>&nbsp;<strong>CONTACT TEAM</strong>&nbsp;</nobr></a></td>
          <td valign="middle" align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='E79DF5'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./calculator.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#&ordering_co=#ordering_co#';return false;"><a class="menu1" href="./calculator.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#&ordering_co=#ordering_co#"><nobr><img src="/client/images/arrowcontact.jpg" border=0>&nbsp;<strong>FEE CALCULATOR</strong>&nbsp;</nobr></a></td>
         <td valign="middle"  align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF0000'" onmouseout="this.bgColor='CCD2D2'"><a class="menu1" href="./coverage_areas.cfm" target="ft_states" onClick="window.open('','ft_states','width=630,height=530,status=0,resizable=0,scrollbars=0')"><nobr><img src="/client/images/arrowproducts.jpg" border=0>&nbsp;COVERAGE AREAS&nbsp;</nobr></a></td>
          <CFIF #read_company.companies_switch# eq "1">
            <CFIF #read_company_user.Administrator# eq "1">
            <td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='00FF66'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./loan_offcr_add.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&ordering_co=#ordering_co#';return false;"> <a class="menu1"  href="./loan_offcr_add.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&ordering_co=#ordering_co#" target="New"><nobr><img src="/client/images/arrowvendor.jpg" border=0>&nbsp;<strong>USER ADMIN</strong>&nbsp;</nobr></a></td>
            </CFIF>
         <CFELSE>
         <td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='00FF66'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./loan_offcr_add.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&ordering_co=#ordering_co#';return false;"> <a class="menu1"  href="./loan_offcr_add.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&ordering_co=#ordering_co#" target="New"><nobr><img src="/client/images/arrowvendor.jpg" border=0>&nbsp;<strong>USER ADMIN</strong>&nbsp;</nobr></a></td>
         </CFIF>
	<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF9900'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./title_client_rep_view.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0&ordering_co=#ordering_co#';return false;"><a class="menu1" href="./title_client_rep_view.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0&ordering_co=#ordering_co#"><nobr><img src="/client/images/arrowcareers.jpg" border=0>&nbsp;<strong>PRODUCT REPORTS</strong>&nbsp;</nobr></a></td>
	<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='0066CC'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./calendar.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#&ordering_co=#ordering_co#';return false;"><a class="menu1" href="./calendar.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#&ordering_co=#ordering_co#"><nobr><img src="/client/images/arrowcompany.jpg" border=0 valign="middel">&nbsp;<strong>CLOSING CALENDAR</strong>&nbsp;</nobr></a></td>
<!--- <td width="95" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 ---></tr></CFOUTPUT></center>
			        	 </table>

	</center> </td> </tr> </TBODY>

</table>

  <table width=776 border="2" cellpadding="0" cellspacing="0" >
  <TBODY>


	<tr>
		<td width=776 align=center border = 1 valign=top bgcolor=e1e1e1>
		<nobr><cfoutput><a href="./client_acct_mgt.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#&ordering_co=#ordering_co#"><FONT FACE=ARIAL SIZE=2 color="red"><b>Back to main</b></font></a></cfoutput></nobr>
<cfif #url.a_trigger# eq "1">
	<CFFORM NAME="frm"  ACTION="./title_client_rep_display.cfm?emp=#emp#&comp_id=#comp_id#&calc=#calc#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=1&ordering_co=#ordering_co#" METHOD=POST>

	<table width=776 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td width=776 align=center valign=top bgcolor=e1e1e1>
		<FONT FACE=verdana SIZE=1 color="blUE">
							<B>SELECT A PRODUCT</b>
		</td></tr>
		<tr>
		<td width=776 align=center valign=top bgcolor=e1e1e1>

				<SELECT NAME="product"	onchange="prodSelect()"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<cfif #url.a_trigger# eq "1"><OPTION VALUE="title" selected>Title</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "2"><OPTION VALUE="property" selected>Property</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "3"><OPTION VALUE="appraisal" selected>Appraisal</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "4"><OPTION VALUE="flood" selected>Flood</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "5"><OPTION VALUE="credit" selected>Credit</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "6"><OPTION VALUE="avm" selected>AVM</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "7"><OPTION VALUE="signing" selected>Signing</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "8">
								<OPTION VALUE="all" selected>All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "10">
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "11">
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								
							<cfelse><OPTION VALUE="Closing" selected>Closing</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								</cfif>
							</SELECT>

	</td>
	</tr>
</table>

<br>



<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->

<table width=776 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=776 align=left valign=top bgcolor="navy">
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Title Commitment Report Search</B></CENTER>
			</TD>
		</TR>
		<tr>
			<td width=776 align=left valign=top bgcolor=elelel>
				<FONT FACE=ARIAL SIZE=2 color="blue">
				<CENTER><B>Please select below to find your order</B></CENTER>
			</TD>
		</TR>
<tr>
			<td width=776 align=center valign=top bgcolor=d3d3d3>





				<table width=600 cellpadding=1 cellspacing=1 border=0>

							<tr>

					<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Title Number
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<SELECT NAME="Title_id"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<OPTION VALUE="NONE">N/A</OPTION>
								<CFOUTPUT QUERY="read_titleid"><OPTION VALUE="#Title_ID#">#Title_ID#</OPTION></CFOUTPUT>
							</SELECT>
						</td>
					</tr>



					<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower's First Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<input type=text name="buyer_fname" size=25 maxlength=15
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e6e6e6;
								border-color: e6e6e6;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;"
								>
						</td>
					</tr>
		<!--- ================================================== --->
					<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower's Last Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<input type=text name="buyer_lname"  size=25 maxlength=25
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e6e6e6;
								border-color: e6e6e6;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;"
								>
						</td>
					</tr>

					</tr>




<!--- ======================================================================== --->

				</table>
		</TD>


			</TR>
			<table width=776 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=776 align=left valign=top colspan=2 bgcolor=elelel>
				<FONT FACE=ARIAL SIZE=2 color="blue">
				<CENTER><B>Advanced Reports</B><br>*Allow you to generate specific reports based on your company's needs</CENTER>
			</TD>
		</TR>

</table>

			<table width=776 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>

							<tr>
						<nobr><td bgcolor=d3d3d3 width=850 align=center valign=top>
								<FONT FACE=verdana SIZE=1 color="black">Date Range: <B>From</B>
		<select name="confirm_mon" onchange="monthresult()"

											size="1"
											style="font-size: 9;
											font-family: verdana;
											font-style: normal;
											color: BLUE;
											background-color: E4E3E3;
											border-color: white;
											border-left-width: thin;
											border-right-width: thin;
											border-top-width: thin;
											border-bottom-width: thin;
											border-width: thin;
											border-style: bar;
											clear: none;
											float: none;"
											rows="3"
											cols="45"
											>
<option value="Month">Month</option>


	   	<option value="01">January</option>
		<option value="02">February</option>
		<option value="03">March</option>
		<option value="04">April</option>
		<option value="05">May</option>
		<option value="06">June</option>
		<option value="07">July</option>
		<option value="08">August</option>
		<option value="09">September</option>
		<option value="10">October</option>
		<option value="11">November</option>
		<option value="12">December</option>


</select>

<select name="comfirm_day" onchange="dayresult()"
size="1"
											style="font-size: 9;
											font-family: verdana;
											font-style: normal;
											color: BLUE;
											background-color: E4E3E3;
											border-color: white;
											border-left-width: thin;
											border-right-width: thin;
											border-top-width: thin;
											border-bottom-width: thin;
											border-width: thin;
											border-style: bar;
											clear: none;
											float: none;"
											rows="3"
											cols="45"
											>



<OPTION VALUE="Day">Day</OPTION>


		<OPTION VALUE="01">01</OPTION>
		<OPTION VALUE="02">02</OPTION>
		<OPTION VALUE="03">03</OPTION>
		<OPTION VALUE="04">04</OPTION>
		<OPTION VALUE="05">05</OPTION>
		<OPTION VALUE="06">06</OPTION>
		<OPTION VALUE="07">07</OPTION>
		<OPTION VALUE="08">08</OPTION>
		<OPTION VALUE="09">09</OPTION>
		<OPTION VALUE="10">10</OPTION>
		<OPTION VALUE="11">11</OPTION>
		<OPTION VALUE="12">12</OPTION>
		<OPTION VALUE="13">13</OPTION>
		<OPTION VALUE="14">14</OPTION>
		<OPTION VALUE="15">15</OPTION>
		<OPTION VALUE="16">16</OPTION>
		<OPTION VALUE="17">17</OPTION>
		<OPTION VALUE="18">18</OPTION>
		<OPTION VALUE="19">19</OPTION>
		<OPTION VALUE="20">20</OPTION>
		<OPTION VALUE="21">21</OPTION>
		<OPTION VALUE="22">22</OPTION>
		<OPTION VALUE="23">23</OPTION>
		<OPTION VALUE="24">24</OPTION>
		<OPTION VALUE="25">25</OPTION>
		<OPTION VALUE="26">26</OPTION>
		<OPTION VALUE="27">27</OPTION>
		<OPTION VALUE="28">28</OPTION>
		<OPTION VALUE="29">29</OPTION>
		<OPTION VALUE="30">30</OPTION>
		<OPTION VALUE="31">31</OPTION>
</select>
<select name="confirm_year" onchange="yearresult()"
size="1"
											style="font-size: 9;
											font-family: verdana;
											font-style: normal;
											color: BLUE;
											background-color: E4E3E3;
											border-color: white;
											border-left-width: thin;
											border-right-width: thin;
											border-top-width: thin;
											border-bottom-width: thin;
											border-width: thin;
											border-style: bar;
											clear: none;
											float: none;"
											rows="3"
											cols="45"
											>



<option value="Year">Year</option>



	   	<option value="2000">2000</option>
		<option value="2001">2001</option>
		<option value="2002">2002</option>
		<option value="2003">2003</option>
		<option value="2004">2004</option>
		<option value="2005">2005</option>
		<option value="2006">2006</option>
		<option value="2007">2007</option>
		<option value="2008">2008</option>
		<option value="2009">2009</option>
		<option value="2010">2010</option>
		<option value="2011">2011</option>
		<option value="2012">2012</option>
		<option value="2013">2013</option>
		<option value="2014">2014</option>
		<option value="2015">2015</option>
		<option value="2016">2016</option>
		<option value="2017">2017</option>
		<option value="2018">2018</option>
		<option value="2019">2019</option>
		<option value="2020">2020</option>
		</select>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT FACE=verdana SIZE=1 color="black"><B>To</B>

		<select name="confirm_mon_to"
		size="1"
											style="font-size: 9;
											font-family: verdana;
											font-style: normal;
											color: BLUE;
											background-color: E4E3E3;
											border-color: white;
											border-left-width: thin;
											border-right-width: thin;
											border-top-width: thin;
											border-bottom-width: thin;
											border-width: thin;
											border-style: bar;
											clear: none;
											float: none;"
											rows="3"
											cols="45"
											>

<option value="Month">Month</option>


	   	<option value="01">January</option>
		<option value="02">February</option>
		<option value="03">March</option>
		<option value="04">April</option>
		<option value="05">May</option>
		<option value="06">June</option>
		<option value="07">July</option>
		<option value="08">August</option>
		<option value="09">September</option>
		<option value="10">October</option>
		<option value="11">November</option>
		<option value="12">December</option>


</select>

<select name="comfirm_day_to"
size="1"
											style="font-size: 9;
											font-family: verdana;
											font-style: normal;
											color: BLUE;
											background-color: E4E3E3;
											border-color: white;
											border-left-width: thin;
											border-right-width: thin;
											border-top-width: thin;
											border-bottom-width: thin;
											border-width: thin;
											border-style: bar;
											clear: none;
											float: none;"
											rows="3"
											cols="45"
											>



<OPTION VALUE="Day">Day</OPTION>


		<OPTION VALUE="01">01</OPTION>
		<OPTION VALUE="02">02</OPTION>
		<OPTION VALUE="03">03</OPTION>
		<OPTION VALUE="04">04</OPTION>
		<OPTION VALUE="05">05</OPTION>
		<OPTION VALUE="06">06</OPTION>
		<OPTION VALUE="07">07</OPTION>
		<OPTION VALUE="08">08</OPTION>
		<OPTION VALUE="09">09</OPTION>
		<OPTION VALUE="10">10</OPTION>
		<OPTION VALUE="11">11</OPTION>
		<OPTION VALUE="12">12</OPTION>
		<OPTION VALUE="13">13</OPTION>
		<OPTION VALUE="14">14</OPTION>
		<OPTION VALUE="15">15</OPTION>
		<OPTION VALUE="16">16</OPTION>
		<OPTION VALUE="17">17</OPTION>
		<OPTION VALUE="18">18</OPTION>
		<OPTION VALUE="19">19</OPTION>
		<OPTION VALUE="20">20</OPTION>
		<OPTION VALUE="21">21</OPTION>
		<OPTION VALUE="22">22</OPTION>
		<OPTION VALUE="23">23</OPTION>
		<OPTION VALUE="24">24</OPTION>
		<OPTION VALUE="25">25</OPTION>
		<OPTION VALUE="26">26</OPTION>
		<OPTION VALUE="27">27</OPTION>
		<OPTION VALUE="28">28</OPTION>
		<OPTION VALUE="29">29</OPTION>
		<OPTION VALUE="30">30</OPTION>
		<OPTION VALUE="31">31</OPTION>
</select>
<select name="confirm_year_to"
size="1"
											style="font-size: 9;
											font-family: verdana;
											font-style: normal;
											color: BLUE;
											background-color: E4E3E3;
											border-color: white;
											border-left-width: thin;
											border-right-width: thin;
											border-top-width: thin;
											border-bottom-width: thin;
											border-width: thin;
											border-style: bar;
											clear: none;
											float: none;"
											rows="3"
											cols="45"
											>



<option value="Year">Year</option>



	   	<option value="2000">2000</option>
		<option value="2001">2001</option>
		<option value="2002">2002</option>
		<option value="2003">2003</option>
		<option value="2004">2004</option>
		<option value="2005">2005</option>
		<option value="2006">2006</option>
		<option value="2007">2007</option>
		<option value="2008">2008</option>
		<option value="2009">2009</option>
		<option value="2010">2010</option>
		<option value="2011">2011</option>
		<option value="2012">2012</option>
		<option value="2013">2013</option>
		<option value="2014">2014</option>
		<option value="2015">2015</option>
		<option value="2016">2016</option>
		<option value="2017">2017</option>
		<option value="2018">2018</option>
		<option value="2019">2019</option>
		<option value="2020">2020</option>
		</select>
						</td></nobr>
					</tr>
		</table>
		<table width=776 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>



<tr>

						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Loan Number -
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
							<input type=text name="loan_number" size=15 maxlength=15
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e6e6e6;
								border-color: e6e6e6;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;"
								>
						</td>
					</tr>

					<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status -
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
									<SELECT NAME="Appraisal_status"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<OPTION VALUE="NONE">N/A</OPTION>
									 <option value="In Process" style="thin">In Process</OPTION>
	  <option value="In Typing">In Typing</OPTION>
	<option value="Report E-mailed" style="thin">Report E-mailed</OPTION>
	<option value="Report Faxed" style="thin" >Report Faxed</OPTION>
	<option value="Cancelled per client" style="thin">Cancelled per client</OPTION>
						</td>
					</tr>
						<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Comments -
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
							<SELECT NAME="comments"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<OPTION VALUE="NONE">N/A</OPTION>
								 <option value="Court House Closed">Court House Closed</OPTION>
	  <option value="Waiting on Tax Info.">Waiting on Tax Info.</OPTION>
	  <option value="In Typing">In Typing</OPTION>
	  <option value="Waiting on Judgment Info">Waiting on Judgment Info</OPTION>
      <option value="Call for Detail">Call for Detail</OPTION>
	  <option value="Judgments Exist">Judgments Exist</OPTION>
	  <option value="Subordination Needed">Subordination Needed</OPTION>
	  <option value="Subordination Received">Subordination Received</OPTION>
	  <option value="Vesting Issue">Vesting Issue</OPTION>
	  <option value="Unreleased Mortgages Exists">Unreleased Mortgages Exists</OPTION>
	  <option value="Clear to Close">Clear to Close</OPTION></SELECT>
						</td>
					</tr>
			<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Sort By -
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
							<SELECT NAME="sortorder"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
<OPTION VALUE="NONE">N/A</OPTION>
<OPTION VALUE="oda_month">Month</OPTION>
<OPTION VALUE="Title_id">Order Number</OPTION>
<OPTION VALUE="comments">Comments</OPTION>
<OPTION VALUE="appraisal_status">Status</OPTION>
<!--- <OPTION VALUE="User_ID">Loan Processor</OPTION> --->
</SELECT>
						</td>
					</tr>
			<tr>

						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Auto-Send email address -
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
							<input type=text name="titlemail" size=35 maxlength=35
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e6e6e6;
								border-color: e6e6e6;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;"
								>
						</td>
					</tr><INPUT TYPE="hidden" NAME="oda_month" VALUE="NONE">
					<tr>
						<td bgcolor=d3d3d3 colspan=2 width=650 align=right valign=top>
							<INPUT TYPE=image src="./images/button_search.gif" border=0>
						</td>

					</tr>
					<tr>
						<td bgcolor=d3d3d3 colspan=2 width=776 align=center valign=top>
					<FONT FACE=verdana SIZE=1 color="blue">Note* When Status selected is "Report Emailed" as listed above, FT system will automatically send completed title commitments to recepient for the date range chosen."
					</td></tr>
		</table>

<tr>
			<td width=776 align=left valign=top bgcolor=navy>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Title Commitment Report Search</B></CENTER>
			</TD>
		</TR>
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
</CFFORM>
			</TD>
		</TR>

	</table>


			</TD>
		</TR>

	</table>



	<cfelseif #a_trigger# eq "2">

	<CFFORM NAME="frm"  ACTION="./title_client_rep_display.cfm?emp=#emp#&comp_id=#comp_id#&calc=#calc#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=2&ordering_co=#ordering_co#" METHOD=POST>
	<table width=776 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td width=776 align=center valign=top bgcolor=e1e1e1>
		<FONT FACE=verdana SIZE=1 color="blUE">
							<B>SELECT A PRODUCT</b>
		</td></tr>
		<tr>
		<td width=776 align=center valign=top bgcolor=e1e1e1>

		<SELECT NAME="product"	onchange="prodSelect()"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<cfif #url.a_trigger# eq "1"><OPTION VALUE="title" selected>Title</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "2"><OPTION VALUE="property" selected>Property</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "3"><OPTION VALUE="appraisal" selected>Appraisal</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "4"><OPTION VALUE="flood" selected>Flood</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "5"><OPTION VALUE="credit" selected>Credit</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "6"><OPTION VALUE="avm" selected>AVM</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "7"><OPTION VALUE="signing" selected>Signing</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "8">
								<OPTION VALUE="all" selected>All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "10">
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "11">
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								
							<cfelse><OPTION VALUE="Closing" selected>Closing</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								</cfif>
							</SELECT>

	</td>
	</tr>
</table>

<br>
<table width=776 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=776 align=left valign=top bgcolor="purple">
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Property Report Search</B></CENTER>
			</TD>
		</TR>
		<tr>
			<td width=776 align=left valign=top bgcolor=elelel>
				<FONT FACE=ARIAL SIZE=2 color="blue">
				<CENTER><B>Please select below to find your order</B></CENTER>
			</TD>
		</TR>
		<tr>
	<td width=776 align=center valign=top bgcolor=d3d3d3>



				<table width=600 cellpadding=1 cellspacing=1 border=0>

							<tr>

					<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Property Number
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<SELECT NAME="Prop_id"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<OPTION VALUE="NONE">N/A</OPTION>
								<CFOUTPUT QUERY="read_titleid_p"><OPTION VALUE="#prop_ID#">0232#prop_ID#</OPTION></CFOUTPUT>
							</SELECT>
						</td>
					</tr>

					<!--- <tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Clients
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<SELECT NAME="company_id"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<OPTION VALUE="NONE">N/A</OPTION>
								<CFOUTPUT QUERY="read_companies"><OPTION VALUE="#ID#">#Company#</OPTION></CFOUTPUT>
							</SELECT>
						</td>
					</tr> --->
		<!--- ================================================== --->
					<!--- <tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Loan Processors
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<SELECT NAME="user_id"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<OPTION VALUE="NONE">N/A</OPTION>
				<CFOUTPUT>
					<CFLOOP FROM="1" TO="#ArrayLen(a_company_name)#" INDEX="AAA">
						<CFIF #a_rec_count[AAA]# NEQ "0">
							<OPTION VALUE="NONE">------------------------------------</OPTION>

							<OPTION VALUE="NONE">#a_company_name[AAA]#</OPTION>
							<CFLOOP FROM="1" TO="#a_rec_count[AAA]#" INDEX="BBB">
								<cfset user_id = #users_id[AAA][BBB]#>
								<OPTION VALUE="#user_id#">&nbsp;&nbsp;--&nbsp;&nbsp;&nbsp;#users_lname[AAA][BBB]#,  #users_fname[AAA][BBB]#</OPTION>
							</CFLOOP>
							<OPTION VALUE="NONE"></OPTION>
						</CFIF>
					</CFLOOP>
				</CFOUTPUT>

							</SELECT>
						</td>
					</tr> --->
		<!--- ================================================== --->

					<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower's First Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<input type=text name="buyer_fname" size=25 maxlength=15
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e6e6e6;
								border-color: e6e6e6;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;"
								>
						</td>
					</tr>
		<!--- ================================================== --->
					<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower's Last Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<input type=text name="buyer_lname"  size=25 maxlength=25
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e6e6e6;
								border-color: e6e6e6;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;"
								>
						</td>
					</tr>
		<!--- ================================================== --->
			<!--- 		<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller First Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<input type=text name="Seller_fname"  size=25 maxlength=15
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e6e6e6;
								border-color: e6e6e6;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;" >
						</td>
					</tr>

					<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller Last Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<input type=text name="seller_lname"  size=25 maxlength=25
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e6e6e6;
								border-color: e6e6e6;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;" >
						</td>
					</tr> --->
		<!--- ================================================== --->
					</tr>

		<!--- ======================================================================== --->

				</table>
		</TD>

		</TR>
			<table width=776 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
				<tr>
					<td width=776 align=left valign=top colspan=2 bgcolor=elelel>
						<FONT FACE=ARIAL SIZE=2 color="blue">
						<CENTER><B>Advanced Reports</B><br>*Allow you to generate specific reports based on your company's needs</CENTER>
					</TD>
				</TR>

				<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Loan Number -
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
							<input type=text name="loan_number" size=15 maxlength=15
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e6e6e6;
								border-color: e6e6e6;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;"
								>
						</td>
					</tr>


			<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Month
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
							<SELECT NAME="oda_month"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<OPTION VALUE="NONE">N/A</OPTION>

	   	<option value="1">January</option>
		<option value="2">February</option>
		<option value="3">March</option>
		<option value="4">April</option>
		<option value="5">May</option>
		<option value="6">June</option>
		<option value="7">July</option>
		<option value="8">August</option>
		<option value="9">September</option>
		<option value="10">October</option>
		<option value="11">November</option>
		<option value="12">December</option>
							</SELECT>
						</td>
					</tr>
					<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
									<SELECT NAME="Appraisal_status"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<OPTION VALUE="NONE">N/A</OPTION>
									 <option value="In Process" style="thin">In Process</OPTION>
	  <option value="In Typing">In Typing</OPTION>
	<option value="Report E-mailed" style="thin">Report E-mailed</OPTION>
	<option value="Report Faxed" style="thin" >Report Faxed</OPTION>
	<option value="Cancelled per client" style="thin">Cancelled per client</OPTION>
						</td>
					</tr>
						<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Comments
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
					<SELECT NAME="comments"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<OPTION VALUE="NONE">N/A</OPTION>
								 <option value="Court House Closed">Court House Closed</OPTION>
	  <option value="Waiting on Tax Info.">Waiting on Tax Info.</OPTION>
	  <option value="In Typing">In Typing</OPTION>
	  <option value="Waiting on Judgment Info">Waiting on Judgment Info</OPTION>
      <option value="Call for Detail">Call for Detail</OPTION>
	  <option value="Judgments Exist">Judgments Exist</OPTION>
	  <option value="Subordination Needed">Subordination Needed</OPTION>
	  <option value="Subordination Received">Subordination Received</OPTION>
	  <option value="Vesting Issue">Vesting Issue</OPTION>
	  <option value="Unreleased Mortgages Exists">Unreleased Mortgages Exists</OPTION>
	  <option value="Clear to Close">Clear to Close</OPTION></SELECT>
						</td>
					</tr>

		<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Sort By
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
							<SELECT NAME="sortorder"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
<OPTION VALUE="NONE">N/A</OPTION>
<OPTION VALUE="oda_month">Month</OPTION>
<OPTION VALUE="Prop_id">Order Number</OPTION>
<OPTION VALUE="comments">Comments</OPTION>
<OPTION VALUE="appraisal_status">Status</OPTION>
<!--- <OPTION VALUE="User_ID">Loan Processor</OPTION> --->
</SELECT>
						</td>
					</tr>


					<tr>
						<td bgcolor=d3d3d3 colspan=2 width=600 align=right valign=top>
							<INPUT TYPE=image src="./images/button_search.gif" border=0>
						</td>

					</tr>
		</table>

<tr>
			<td width=776 align=left valign=top bgcolor=purple>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Property Report Search</B></CENTER>
			</TD>
		</TR>
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
</CFFORM>
			</TD>
		</TR>

	</table>
			</TD>
		</TR>

	</table>

	<cfelseif #a_trigger# eq "3">

		<CFFORM NAME="frm" ACTION="./title_client_rep_display.cfm?emp=#emp#&comp_id=#comp_id#&calc=#calc#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=3&ordering_co=#ordering_co#" METHOD=POST>
<table width=776 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td width=776 align=center valign=top bgcolor=e1e1e1>
		<FONT FACE=verdana SIZE=1 color="blUE">
							<B>SELECT A PRODUCT</b>
		</td></tr>
		<tr>
		<td width=776 align=center valign=top bgcolor=e1e1e1>

		<SELECT NAME="product"	onchange="prodSelect()"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<cfif #url.a_trigger# eq "1"><OPTION VALUE="title" selected>Title</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "2"><OPTION VALUE="property" selected>Property</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "3"><OPTION VALUE="appraisal" selected>Appraisal</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "4"><OPTION VALUE="flood" selected>Flood</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "5"><OPTION VALUE="credit" selected>Credit</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "6"><OPTION VALUE="avm" selected>AVM</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "7"><OPTION VALUE="signing" selected>Signing</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "8">
								<OPTION VALUE="all" selected>All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "10">
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "11">
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								
							<cfelse><OPTION VALUE="Closing" selected>Closing</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								</cfif>

							</SELECT>

	</td>
	</tr>
</table>

<br>

<table width=776 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=776 align=left valign=top bgcolor="blue">
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Appraisal Report Search</B></CENTER>
			</TD>
		</TR>
		<tr>
			<td width=776 align=left valign=top bgcolor=elelel>
				<FONT FACE=ARIAL SIZE=2 color="blue">
				<CENTER><B>Please select below to find your order</B></CENTER>
			</TD>
		</TR>

	<tr>
			<td width=776 align=center valign=top bgcolor=d3d3d3>



				<table width=600 cellpadding=1 cellspacing=1 border=0>

							<tr>

					<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Appraisal Number
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<SELECT NAME="App_id"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<OPTION VALUE="NONE">N/A</OPTION>
								<CFOUTPUT QUERY="read_titleid_a"><OPTION VALUE="#app_ID#">#app_ID#</OPTION></CFOUTPUT>
							</SELECT>
						</td>
					</tr>

					<!--- <tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Clients
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<SELECT NAME="company_id"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<OPTION VALUE="NONE">N/A</OPTION>
								<CFOUTPUT QUERY="read_companies"><OPTION VALUE="#ID#">#Company#</OPTION></CFOUTPUT>
							</SELECT>
						</td>
					</tr> --->
		<!--- ================================================== --->
					<!--- <tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Loan Processors
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<SELECT NAME="user_id"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<OPTION VALUE="NONE">N/A</OPTION>
				<CFOUTPUT>
					<CFLOOP FROM="1" TO="#ArrayLen(a_company_name)#" INDEX="AAA">
						<CFIF #a_rec_count[AAA]# NEQ "0">
							<OPTION VALUE="NONE">------------------------------------</OPTION>

							<OPTION VALUE="NONE">#a_company_name[AAA]#</OPTION>
							<CFLOOP FROM="1" TO="#a_rec_count[AAA]#" INDEX="BBB">
								<cfset user_id = #users_id[AAA][BBB]#>
								<OPTION VALUE="#user_id#">&nbsp;&nbsp;--&nbsp;&nbsp;&nbsp;#users_lname[AAA][BBB]#,  #users_fname[AAA][BBB]#</OPTION>
							</CFLOOP>
							<OPTION VALUE="NONE"></OPTION>
						</CFIF>
					</CFLOOP>
				</CFOUTPUT>

							</SELECT>
						</td>
					</tr> --->
		<!--- ================================================== --->

					<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower's First Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<input type=text name="buyer_fname" size=25 maxlength=15
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e6e6e6;
								border-color: e6e6e6;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;"
								>
						</td>
					</tr>
		<!--- ================================================== --->
					<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower's Last Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<input type=text name="buyer_lname"  size=25 maxlength=25
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e6e6e6;
								border-color: e6e6e6;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;"
								>
						</td>
					</tr>
		<!--- ================================================== --->
			<!--- 		<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller First Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<input type=text name="Seller_fname"  size=25 maxlength=15
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e6e6e6;
								border-color: e6e6e6;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;" >
						</td>
					</tr>

					<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller Last Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<input type=text name="seller_lname"  size=25 maxlength=25
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e6e6e6;
								border-color: e6e6e6;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;" >
						</td>
					</tr> --->
		<!--- ================================================== --->
					</tr>




<!--- ======================================================================== --->

				</table>
		</TD>


			</TR>
			<table width=776 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=776 align=left valign=top colspan=2 bgcolor=elelel>
				<FONT FACE=ARIAL SIZE=2 color="blue">
				<CENTER><B>Advanced Reports</B><br>*Allow you to generate specific reports based on your company's needs</CENTER>
			</TD>
		</TR>

<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Loan Number -
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
							<input type=text name="loan_number" size=15 maxlength=15
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e6e6e6;
								border-color: e6e6e6;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;"
								>
						</td>
					</tr>



			<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Month
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
							<SELECT NAME="oda_month"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<OPTION VALUE="NONE">N/A</OPTION>

	   	<option value="1">January</option>
		<option value="2">February</option>
		<option value="3">March</option>
		<option value="4">April</option>
		<option value="5">May</option>
		<option value="6">June</option>
		<option value="7">July</option>
		<option value="8">August</option>
		<option value="9">September</option>
		<option value="10">October</option>
		<option value="11">November</option>
		<option value="12">December</option>
							</SELECT>
						</td>
					</tr>
					<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
									<SELECT NAME="Appraisal_status"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<OPTION VALUE="NONE">N/A</OPTION>
									 <option value="In Process" style="thin">In Process</OPTION>
	  <option value="In Typing">In Typing</OPTION>
	<option value="Report E-mailed" style="thin">Report E-mailed</OPTION>
	<option value="Report Faxed" style="thin" >Report Faxed</OPTION>
	<option value="Cancelled per client" style="thin">Cancelled per client</OPTION>
						</td>
					</tr>
						<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Comments
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
					<SELECT NAME="comments"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<OPTION VALUE="NONE">N/A</OPTION>
								 <option value="Court House Closed">Court House Closed</OPTION>
	  <option value="Waiting on Tax Info.">Waiting on Tax Info.</OPTION>
	  <option value="In Typing">In Typing</OPTION>
	  <option value="Waiting on Judgment Info">Waiting on Judgment Info</OPTION>
      <option value="Call for Detail">Call for Detail</OPTION>
	  <option value="Judgments Exist">Judgments Exist</OPTION>
	  <option value="Subordination Needed">Subordination Needed</OPTION>
	  <option value="Subordination Received">Subordination Received</OPTION>
	  <option value="Vesting Issue">Vesting Issue</OPTION>
	  <option value="Unreleased Mortgages Exists">Unreleased Mortgages Exists</OPTION>
	  <option value="Clear to Close">Clear to Close</OPTION></SELECT>
						</td>
					</tr>


<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Sort By
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
							<SELECT NAME="sortorder"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
<OPTION VALUE="NONE">N/A</OPTION>
<OPTION VALUE="oda_month">Month</OPTION>
<OPTION VALUE="App_id">Order Number</OPTION>
<OPTION VALUE="comments">Comments</OPTION>
<OPTION VALUE="appraisal_status">Status</OPTION>
<!--- <OPTION VALUE="User_ID">Loan Processor</OPTION> --->
</SELECT>
						</td>
					</tr>


					<tr>
						<td bgcolor=d3d3d3 colspan=2 width=600 align=right valign=top>
							<INPUT TYPE=image src="./images/button_search.gif" border=0>
						</td>

					</tr>
		</table>

<tr>
			<td width=776 align=left valign=top bgcolor=Blue>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Appraisal Report Search</B></CENTER>
			</TD>
		</TR>
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
</CFFORM>
			</TD>
		</TR>

	</table>


			</TD>
		</TR>

	</table>

	<cfelseif #a_trigger# eq 4>
	<CFFORM NAME="frm" ACTION="./title_client_rep_display.cfm?emp=#emp#&comp_id=#comp_id#&calc=#calc#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=4&ordering_co=#ordering_co#" METHOD=POST>

	<table width=776 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td width=776 align=center valign=top bgcolor=e1e1e1>
		<FONT FACE=verdana SIZE=1 color="blUE">
							<B>SELECT A PRODUCT</b>
		</td></tr>
		<tr>
		<td width=776 align=center valign=top bgcolor=e1e1e1>

				<SELECT NAME="product"	onchange="prodSelect()"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<cfif #url.a_trigger# eq "1"><OPTION VALUE="title" selected>Title</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "2"><OPTION VALUE="property" selected>Property</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "3"><OPTION VALUE="appraisal" selected>Appraisal</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "4"><OPTION VALUE="flood" selected>Flood</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "5"><OPTION VALUE="credit" selected>Credit</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "6"><OPTION VALUE="avm" selected>AVM</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "7"><OPTION VALUE="signing" selected>Signing</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "8">
								<OPTION VALUE="all" selected>All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "10">
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "11">
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								
							<cfelse><OPTION VALUE="Closing" selected>Closing</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								</cfif>
							</SELECT>

	</td>
	</tr>
</table>

<br>

<table width=776 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=776 align=left valign=top bgcolor="orange">
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Flood Report Search</B></CENTER>
			</TD>
		</TR>
		<tr>
			<td width=776 align=left valign=top bgcolor=elelel>
				<FONT FACE=ARIAL SIZE=2 color="blue">
				<CENTER><B>Please select below to find your order</B></CENTER>
			</TD>
		</TR>
<tr>
			<td width=776 align=center valign=top bgcolor=d3d3d3>



				<table width=600 cellpadding=1 cellspacing=1 border=0>

							<tr>

					<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Flood Number
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<SELECT NAME="Anc_id"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<OPTION VALUE="NONE">N/A</OPTION>
								<CFOUTPUT QUERY="read_titleid_anc"><OPTION VALUE="#Anc_ID#">#Anc_ID#</OPTION></CFOUTPUT>
							</SELECT>
						</td>
					</tr>

					<!--- <tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Clients
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<SELECT NAME="company_id"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<OPTION VALUE="NONE">N/A</OPTION>
								<CFOUTPUT QUERY="read_companies"><OPTION VALUE="#ID#">#Company#</OPTION></CFOUTPUT>
							</SELECT>
						</td>
					</tr> --->
		<!--- ================================================== --->
					<!--- <tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Loan Processors
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<SELECT NAME="user_id"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<OPTION VALUE="NONE">N/A</OPTION>
				<CFOUTPUT>
					<CFLOOP FROM="1" TO="#ArrayLen(a_company_name)#" INDEX="AAA">
						<CFIF #a_rec_count[AAA]# NEQ "0">
							<OPTION VALUE="NONE">------------------------------------</OPTION>

							<OPTION VALUE="NONE">#a_company_name[AAA]#</OPTION>
							<CFLOOP FROM="1" TO="#a_rec_count[AAA]#" INDEX="BBB">
								<cfset user_id = #users_id[AAA][BBB]#>
								<OPTION VALUE="#user_id#">&nbsp;&nbsp;--&nbsp;&nbsp;&nbsp;#users_lname[AAA][BBB]#,  #users_fname[AAA][BBB]#</OPTION>
							</CFLOOP>
							<OPTION VALUE="NONE"></OPTION>
						</CFIF>
					</CFLOOP>
				</CFOUTPUT>

							</SELECT>
						</td>
					</tr> --->
		<!--- ================================================== --->

					<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower's First Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<input type=text name="buyer_fname" size=25 maxlength=15
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e6e6e6;
								border-color: e6e6e6;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;"
								>
						</td>
					</tr>
		<!--- ================================================== --->
					<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower's Last Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<input type=text name="buyer_lname"  size=25 maxlength=25
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e6e6e6;
								border-color: e6e6e6;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;"
								>
						</td>
					</tr>
		<!--- ================================================== --->
			<!--- 		<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller First Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<input type=text name="Seller_fname"  size=25 maxlength=15
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e6e6e6;
								border-color: e6e6e6;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;" >
						</td>
					</tr>

					<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller Last Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<input type=text name="seller_lname"  size=25 maxlength=25
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e6e6e6;
								border-color: e6e6e6;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;" >
						</td>
					</tr> --->
		<!--- ================================================== --->
					</tr>




<!--- ======================================================================== --->

				</table>
		</TD>


			</TR>
			<table width=776 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=776 align=left valign=top colspan=2 bgcolor=elelel>
				<FONT FACE=ARIAL SIZE=2 color="blue">
				<CENTER><B>Advanced Reports</B><br>*Allow you to generate specific reports based on your company's needs</CENTER>
			</TD>
		</TR>

<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Loan Number -
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
							<input type=text name="loan_number" size=15 maxlength=15
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e6e6e6;
								border-color: e6e6e6;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;"
								>
						</td>
					</tr>


			<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Month
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
							<SELECT NAME="oda_month"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<OPTION VALUE="NONE">N/A</OPTION>

	   	<option value="1">January</option>
		<option value="2">February</option>
		<option value="3">March</option>
		<option value="4">April</option>
		<option value="5">May</option>
		<option value="6">June</option>
		<option value="7">July</option>
		<option value="8">August</option>
		<option value="9">September</option>
		<option value="10">October</option>
		<option value="11">November</option>
		<option value="12">December</option>
							</SELECT>
						</td>
					</tr>
					<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
									<SELECT NAME="Appraisal_status"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<OPTION VALUE="NONE">N/A</OPTION>
									 <option value="In Process" style="thin">In Process</OPTION>
	  <option value="In Typing">In Typing</OPTION>
	<option value="Report E-mailed" style="thin">Report E-mailed</OPTION>
	<option value="Report Faxed" style="thin" >Report Faxed</OPTION>
	<option value="Cancelled per client" style="thin">Cancelled per client</OPTION>
						</td>
					</tr>
						<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Comments
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
					<SELECT NAME="comments"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<OPTION VALUE="NONE">N/A</OPTION>
								 <option value="Court House Closed">Court House Closed</OPTION>
	  <option value="Waiting on Tax Info.">Waiting on Tax Info.</OPTION>
	  <option value="In Typing">In Typing</OPTION>
	  <option value="Waiting on Judgment Info">Waiting on Judgment Info</OPTION>
      <option value="Call for Detail">Call for Detail</OPTION>
	  <option value="Judgments Exist">Judgments Exist</OPTION>
	  <option value="Subordination Needed">Subordination Needed</OPTION>
	  <option value="Subordination Received">Subordination Received</OPTION>
	  <option value="Vesting Issue">Vesting Issue</OPTION>
	  <option value="Unreleased Mortgages Exists">Unreleased Mortgages Exists</OPTION>
	  <option value="Clear to Close">Clear to Close</OPTION></SELECT>
						</td>
					</tr>



<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Sort By
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
							<SELECT NAME="sortorder"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
<OPTION VALUE="NONE">N/A</OPTION>
<OPTION VALUE="oda_month">Month</OPTION>
<OPTION VALUE="Anc_id">Order Number</OPTION>
<OPTION VALUE="comments">Comments</OPTION>
<OPTION VALUE="appraisal_status">Status</OPTION>
<!--- <OPTION VALUE="User_ID">Loan Processor</OPTION> --->
</SELECT>
						</td>
					</tr>

					<tr>
						<td bgcolor=d3d3d3 colspan=2 width=600 align=right valign=top>
							<INPUT TYPE=image src="./images/button_search.gif" border=0>
						</td>

					</tr>
		</table>

<tr>
			<td width=776 align=left valign=top bgcolor=orange>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Flood Report Search</B></CENTER>
			</TD>
		</TR>
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
</CFFORM>
			</TD>
		</TR>

	</table>


			</TD>
		</TR>

	</table>

		<cfelseif #a_trigger# eq 5>
	<CFFORM NAME="frm" ACTION="./title_client_rep_display.cfm?emp=#emp#&comp_id=#comp_id#&calc=#calc#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=5&ordering_co=#ordering_co#" METHOD=POST>

	<table width=776 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td width=776 align=center valign=top bgcolor=e1e1e1>
		<FONT FACE=verdana SIZE=1 color="blUE">
							<B>SELECT A PRODUCT</b>
		</td></tr>
		<tr>
		<td width=776 align=center valign=top bgcolor=e1e1e1>

				<SELECT NAME="product"	onchange="prodSelect()"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<cfif #url.a_trigger# eq "1"><OPTION VALUE="title" selected>Title</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "2"><OPTION VALUE="property" selected>Property</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "3"><OPTION VALUE="appraisal" selected>Appraisal</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "4"><OPTION VALUE="flood" selected>Flood</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "5"><OPTION VALUE="credit" selected>Credit</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "6"><OPTION VALUE="avm" selected>AVM</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "7"><OPTION VALUE="signing" selected>Signing</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "8">
								<OPTION VALUE="all" selected>All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "10">
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "11">
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								
							<cfelse><OPTION VALUE="Closing" selected>Closing</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								</cfif>

							</SELECT>

	</td>
	</tr>
</table>

<br>

<table width=776 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=776 align=left valign=top bgcolor="red">
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Credit Report Search</B></CENTER>
			</TD>
		</TR>
		<tr>
			<td width=776 align=left valign=top bgcolor=elelel>
				<FONT FACE=ARIAL SIZE=2 color="blue">
				<CENTER><B>Please select below to find your order</B></CENTER>
			</TD>
		</TR>
<tr>
			<td width=776 align=center valign=top bgcolor=d3d3d3>



				<table width=600 cellpadding=1 cellspacing=1 border=0>

							<tr>

					<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Credit Number
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<SELECT NAME="cr_id"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<OPTION VALUE="NONE">N/A</OPTION>
								<CFOUTPUT QUERY="read_titleid_cr"><OPTION VALUE="#Anc_ID#">#Anc_ID#</OPTION></CFOUTPUT>
							</SELECT>
						</td>
					</tr>

					<!--- <tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Clients
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<SELECT NAME="company_id"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<OPTION VALUE="NONE">N/A</OPTION>
								<CFOUTPUT QUERY="read_companies"><OPTION VALUE="#ID#">#Company#</OPTION></CFOUTPUT>
							</SELECT>
						</td>
					</tr> --->
		<!--- ================================================== --->
					<!--- <tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Loan Processors
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<SELECT NAME="user_id"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<OPTION VALUE="NONE">N/A</OPTION>
				<CFOUTPUT>
					<CFLOOP FROM="1" TO="#ArrayLen(a_company_name)#" INDEX="AAA">
						<CFIF #a_rec_count[AAA]# NEQ "0">
							<OPTION VALUE="NONE">------------------------------------</OPTION>

							<OPTION VALUE="NONE">#a_company_name[AAA]#</OPTION>
							<CFLOOP FROM="1" TO="#a_rec_count[AAA]#" INDEX="BBB">
								<cfset user_id = #users_id[AAA][BBB]#>
								<OPTION VALUE="#user_id#">&nbsp;&nbsp;--&nbsp;&nbsp;&nbsp;#users_lname[AAA][BBB]#,  #users_fname[AAA][BBB]#</OPTION>
							</CFLOOP>
							<OPTION VALUE="NONE"></OPTION>
						</CFIF>
					</CFLOOP>
				</CFOUTPUT>

							</SELECT>
						</td>
					</tr> --->
		<!--- ================================================== --->

					<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower's First Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<input type=text name="buyer_fname" size=25 maxlength=15
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e6e6e6;
								border-color: e6e6e6;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;"
								>
						</td>
					</tr>
		<!--- ================================================== --->
					<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower's Last Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<input type=text name="buyer_lname"  size=25 maxlength=25
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e6e6e6;
								border-color: e6e6e6;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;"
								>
						</td>
					</tr>
		<!--- ================================================== --->
			<!--- 		<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller First Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<input type=text name="Seller_fname"  size=25 maxlength=15
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e6e6e6;
								border-color: e6e6e6;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;" >
						</td>
					</tr>

					<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller Last Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<input type=text name="seller_lname"  size=25 maxlength=25
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e6e6e6;
								border-color: e6e6e6;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;" >
						</td>
					</tr> --->
		<!--- ================================================== --->
					</tr>




<!--- ======================================================================== --->

				</table>
		</TD>


			</TR>
			<table width=776 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=776 align=left valign=top colspan=2 bgcolor=elelel>
				<FONT FACE=ARIAL SIZE=2 color="blue">
				<CENTER><B>Advanced Reports</B><br>*Allow you to generate specific reports based on your company's needs</CENTER>
			</TD>
		</TR>

<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Loan Number -
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
							<input type=text name="loan_number" size=15 maxlength=15
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e6e6e6;
								border-color: e6e6e6;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;"
								>
						</td>
					</tr>


			<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Month
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
							<SELECT NAME="oda_month"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<OPTION VALUE="NONE">N/A</OPTION>

	   	<option value="1">January</option>
		<option value="2">February</option>
		<option value="3">March</option>
		<option value="4">April</option>
		<option value="5">May</option>
		<option value="6">June</option>
		<option value="7">July</option>
		<option value="8">August</option>
		<option value="9">September</option>
		<option value="10">October</option>
		<option value="11">November</option>
		<option value="12">December</option>
							</SELECT>
						</td>
					</tr>
					<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
									<SELECT NAME="Appraisal_status"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<OPTION VALUE="NONE">N/A</OPTION>
									 <option value="In Process" style="thin">In Process</OPTION>
	  <option value="In Typing">In Typing</OPTION>
	<option value="Report E-mailed" style="thin">Report E-mailed</OPTION>
	<option value="Report Faxed" style="thin" >Report Faxed</OPTION>
	<option value="Cancelled per client" style="thin">Cancelled per client</OPTION>
						</td>
					</tr>
						<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Comments
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
					<SELECT NAME="comments"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<OPTION VALUE="NONE">N/A</OPTION>
								 <option value="Court House Closed">Court House Closed</OPTION>
	  <option value="Waiting on Tax Info.">Waiting on Tax Info.</OPTION>
	  <option value="In Typing">In Typing</OPTION>
	  <option value="Waiting on Judgment Info">Waiting on Judgment Info</OPTION>
      <option value="Call for Detail">Call for Detail</OPTION>
	  <option value="Judgments Exist">Judgments Exist</OPTION>
	  <option value="Subordination Needed">Subordination Needed</OPTION>
	  <option value="Subordination Received">Subordination Received</OPTION>
      <option value="Vesting Issue">Vesting Issue</OPTION>
	  <option value="Unreleased Mortgages Exists">Unreleased Mortgages Exists</OPTION>
	  <option value="Clear to Close">Clear to Close</OPTION></SELECT>
						</td>
					</tr>



<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Sort By
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
							<SELECT NAME="sortorder"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
<OPTION VALUE="NONE">N/A</OPTION>
<OPTION VALUE="oda_month">Month</OPTION>
<OPTION VALUE="Anc_id">Order Number</OPTION>
<OPTION VALUE="comments">Comments</OPTION>
<OPTION VALUE="appraisal_status">Status</OPTION>
<!--- <OPTION VALUE="User_ID">Loan Processor</OPTION> --->
</SELECT>
						</td>
					</tr>

					<tr>
						<td bgcolor=d3d3d3 colspan=2 width=600 align=right valign=top>
							<INPUT TYPE=image src="./images/button_search.gif" border=0>
						</td>

					</tr>
		</table>

<tr>
			<td width=776 align=left valign=top bgcolor=red>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Credit Report Search</B></CENTER>
			</TD>
		</TR>
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
</CFFORM>
			</TD>
		</TR>

	</table>


			</TD>
		</TR>

	</table>

		<cfelseif #a_trigger# eq 6>
	<CFFORM NAME="frm" ACTION="./title_client_rep_display.cfm?emp=#emp#&comp_id=#comp_id#&calc=#calc#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=6&ordering_co=#ordering_co#" METHOD=POST>

	<table width=776 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td width=776 align=center valign=top bgcolor=e1e1e1>
		<FONT FACE=verdana SIZE=1 color="blUE">
							<B>SELECT A PRODUCT</b>
		</td></tr>
		<tr>
		<td width=776 align=center valign=top bgcolor=e1e1e1>

				<SELECT NAME="product"	onchange="prodSelect()"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<cfif #url.a_trigger# eq "1"><OPTION VALUE="title" selected>Title</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "2"><OPTION VALUE="property" selected>Property</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "3"><OPTION VALUE="appraisal" selected>Appraisal</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "4"><OPTION VALUE="flood" selected>Flood</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "5"><OPTION VALUE="credit" selected>Credit</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "6"><OPTION VALUE="avm" selected>AVM</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "7"><OPTION VALUE="signing" selected>Signing</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "8">
								<OPTION VALUE="all" selected>All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "10">
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "11">
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								
							<cfelse><OPTION VALUE="Closing" selected>Closing</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								</cfif>

							</SELECT>

	</td>
	</tr>
</table>

<br>

<table width=776 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=776 align=left valign=top bgcolor="brown">
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>AVM Report Search</B></CENTER>
			</TD>
		</TR>
		<tr>
			<td width=776 align=left valign=top bgcolor=elelel>
				<FONT FACE=ARIAL SIZE=2 color="blue">
				<CENTER><B>Please select below to find your order</B></CENTER>
			</TD>
		</TR>
<tr>
			<td width=776 align=center valign=top bgcolor=d3d3d3>



				<table width=600 cellpadding=1 cellspacing=1 border=0>

							<tr>

					<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							AVM Number
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<SELECT NAME="avm_id"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<OPTION VALUE="NONE">N/A</OPTION>
								<CFOUTPUT QUERY="read_titleid_avm"><OPTION VALUE="#Anc_ID#">#Anc_ID#</OPTION></CFOUTPUT>
							</SELECT>
						</td>
					</tr>

					<!--- <tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Clients
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<SELECT NAME="company_id"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<OPTION VALUE="NONE">N/A</OPTION>
								<CFOUTPUT QUERY="read_companies"><OPTION VALUE="#ID#">#Company#</OPTION></CFOUTPUT>
							</SELECT>
						</td>
					</tr> --->
		<!--- ================================================== --->
					<!--- <tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Loan Processors
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<SELECT NAME="user_id"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<OPTION VALUE="NONE">N/A</OPTION>
				<CFOUTPUT>
					<CFLOOP FROM="1" TO="#ArrayLen(a_company_name)#" INDEX="AAA">
						<CFIF #a_rec_count[AAA]# NEQ "0">
							<OPTION VALUE="NONE">------------------------------------</OPTION>

							<OPTION VALUE="NONE">#a_company_name[AAA]#</OPTION>
							<CFLOOP FROM="1" TO="#a_rec_count[AAA]#" INDEX="BBB">
								<cfset user_id = #users_id[AAA][BBB]#>
								<OPTION VALUE="#user_id#">&nbsp;&nbsp;--&nbsp;&nbsp;&nbsp;#users_lname[AAA][BBB]#,  #users_fname[AAA][BBB]#</OPTION>
							</CFLOOP>
							<OPTION VALUE="NONE"></OPTION>
						</CFIF>
					</CFLOOP>
				</CFOUTPUT>

							</SELECT>
						</td>
					</tr> --->
		<!--- ================================================== --->

					<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower's First Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<input type=text name="buyer_fname" size=25 maxlength=15
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e6e6e6;
								border-color: e6e6e6;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;"
								>
						</td>
					</tr>
		<!--- ================================================== --->
					<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower's Last Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<input type=text name="buyer_lname"  size=25 maxlength=25
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e6e6e6;
								border-color: e6e6e6;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;"
								>
						</td>
					</tr>
		<!--- ================================================== --->
			<!--- 		<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller First Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<input type=text name="Seller_fname"  size=25 maxlength=15
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e6e6e6;
								border-color: e6e6e6;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;" >
						</td>
					</tr>

					<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller Last Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<input type=text name="seller_lname"  size=25 maxlength=25
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e6e6e6;
								border-color: e6e6e6;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;" >
						</td>
					</tr> --->
		<!--- ================================================== --->
					</tr>




<!--- ======================================================================== --->

				</table>
		</TD>


			</TR>
			<table width=776 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=776 align=left valign=top colspan=2 bgcolor=elelel>
				<FONT FACE=ARIAL SIZE=2 color="blue">
				<CENTER><B>Advanced Reports</B><br>*Allow you to generate specific reports based on your company's needs</CENTER>
			</TD>
		</TR>

<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Loan Number -
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
							<input type=text name="loan_number" size=15 maxlength=15
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e6e6e6;
								border-color: e6e6e6;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;"
								>
						</td>
					</tr>


			<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Month
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
							<SELECT NAME="oda_month"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<OPTION VALUE="NONE">N/A</OPTION>

	   	<option value="1">January</option>
		<option value="2">February</option>
		<option value="3">March</option>
		<option value="4">April</option>
		<option value="5">May</option>
		<option value="6">June</option>
		<option value="7">July</option>
		<option value="8">August</option>
		<option value="9">September</option>
		<option value="10">October</option>
		<option value="11">November</option>
		<option value="12">December</option>
							</SELECT>
						</td>
					</tr>
					<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
									<SELECT NAME="Appraisal_status"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<OPTION VALUE="NONE">N/A</OPTION>
									 <option value="In Process" style="thin">In Process</OPTION>
	  <option value="In Typing">In Typing</OPTION>
	<option value="Report E-mailed" style="thin">Report E-mailed</OPTION>
	<option value="Report Faxed" style="thin" >Report Faxed</OPTION>
	<option value="Cancelled per client" style="thin">Cancelled per client</OPTION>
						</td>
					</tr>
						<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Comments
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
					<SELECT NAME="comments"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<OPTION VALUE="NONE">N/A</OPTION>
								 <option value="Court House Closed">Court House Closed</OPTION>
	  <option value="Waiting on Tax Info.">Waiting on Tax Info.</OPTION>
	  <option value="In Typing">In Typing</OPTION>
	  <option value="Waiting on Judgment Info">Waiting on Judgment Info</OPTION>
      <option value="Call for Detail">Call for Detail</OPTION>
	  <option value="Judgments Exist">Judgments Exist</OPTION>
	  <option value="Subordination Needed">Subordination Needed</OPTION>
	  <option value="Subordination Received">Subordination Received</OPTION>
	  <option value="Vesting Issue">Vesting Issue</OPTION>
	  <option value="Unreleased Mortgages Exists">Unreleased Mortgages Exists</OPTION>
	  <option value="Clear to Close">Clear to Close</OPTION></SELECT>
						</td>
					</tr>



<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Sort By
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
							<SELECT NAME="sortorder"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
<OPTION VALUE="NONE">N/A</OPTION>
<OPTION VALUE="oda_month">Month</OPTION>
<OPTION VALUE="Anc_id">Order Number</OPTION>
<OPTION VALUE="comments">Comments</OPTION>
<OPTION VALUE="appraisal_status">Status</OPTION>
<!--- <OPTION VALUE="User_ID">Loan Processor</OPTION> --->
</SELECT>
						</td>
					</tr>

					<tr>
						<td bgcolor=d3d3d3 colspan=2 width=600 align=right valign=top>
							<INPUT TYPE=image src="./images/button_search.gif" border=0>
						</td>

					</tr>
		</table>

<tr>
			<td width=776 align=left valign=top bgcolor=brown>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>AVM Report Search</B></CENTER>
			</TD>
		</TR>
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
</CFFORM>
			</TD>
		</TR>

	</table>


			</TD>
		</TR>

	</table>
<cfelseif #a_trigger# eq 7>
	<CFFORM NAME="frm" ACTION="./title_client_rep_display.cfm?emp=#emp#&comp_id=#comp_id#&calc=#calc#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=7&ordering_co=#ordering_co#" METHOD=POST>

	<table width=776 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td width=776 align=center valign=top bgcolor=e1e1e1>
		<FONT FACE=verdana SIZE=1 color="blUE">
							<B>SELECT A PRODUCT</b>
		</td></tr>
		<tr>
		<td width=776 align=center valign=top bgcolor=e1e1e1>

		<SELECT NAME="product"	onchange="prodSelect()"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<cfif #url.a_trigger# eq "1"><OPTION VALUE="title" selected>Title</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "2"><OPTION VALUE="property" selected>Property</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "3"><OPTION VALUE="appraisal" selected>Appraisal</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "4"><OPTION VALUE="flood" selected>Flood</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "5"><OPTION VALUE="credit" selected>Credit</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "6"><OPTION VALUE="avm" selected>AVM</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "7"><OPTION VALUE="signing" selected>Signing</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "8">
								<OPTION VALUE="all" selected>All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "10">
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "11">
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								
							<cfelse><OPTION VALUE="Closing" selected>Closing</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								</cfif>
							</SELECT>

	</td>
	</tr>
</table>

<br>

<table width=776 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=776 align=left valign=top bgcolor="green">
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Signing Report Search</B></CENTER>
			</TD>
		</TR>
		<tr>
			<td width=776 align=left valign=top bgcolor=elelel>
				<FONT FACE=ARIAL SIZE=2 color="blue">
				<CENTER><B>Please select below to find your order</B></CENTER>
			</TD>
		</TR>
<tr>
			<td width=776 align=center valign=top bgcolor=d3d3d3>



				<table width=600 cellpadding=1 cellspacing=1 border=0>

							<tr>

					<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Signing Number
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<SELECT NAME="sn_id"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<OPTION VALUE="NONE">N/A</OPTION>
								<CFOUTPUT QUERY="read_titleid_sn"><OPTION VALUE="#Anc_ID#">#Anc_ID#</OPTION></CFOUTPUT>
							</SELECT>
						</td>
					</tr>

					<!--- <tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Clients
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<SELECT NAME="company_id"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<OPTION VALUE="NONE">N/A</OPTION>
								<CFOUTPUT QUERY="read_companies"><OPTION VALUE="#ID#">#Company#</OPTION></CFOUTPUT>
							</SELECT>
						</td>
					</tr> --->
		<!--- ================================================== --->
					<!--- <tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Loan Processors
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<SELECT NAME="user_id"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<OPTION VALUE="NONE">N/A</OPTION>
				<CFOUTPUT>
					<CFLOOP FROM="1" TO="#ArrayLen(a_company_name)#" INDEX="AAA">
						<CFIF #a_rec_count[AAA]# NEQ "0">
							<OPTION VALUE="NONE">------------------------------------</OPTION>

							<OPTION VALUE="NONE">#a_company_name[AAA]#</OPTION>
							<CFLOOP FROM="1" TO="#a_rec_count[AAA]#" INDEX="BBB">
								<cfset user_id = #users_id[AAA][BBB]#>
								<OPTION VALUE="#user_id#">&nbsp;&nbsp;--&nbsp;&nbsp;&nbsp;#users_lname[AAA][BBB]#,  #users_fname[AAA][BBB]#</OPTION>
							</CFLOOP>
							<OPTION VALUE="NONE"></OPTION>
						</CFIF>
					</CFLOOP>
				</CFOUTPUT>

							</SELECT>
						</td>
					</tr> --->
		<!--- ================================================== --->

					<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower's First Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<input type=text name="buyer_fname" size=25 maxlength=15
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e6e6e6;
								border-color: e6e6e6;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;"
								>
						</td>
					</tr>
		<!--- ================================================== --->
					<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower's Last Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<input type=text name="buyer_lname"  size=25 maxlength=25
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e6e6e6;
								border-color: e6e6e6;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;"
								>
						</td>
					</tr>
		<!--- ================================================== --->
			<!--- 		<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller First Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<input type=text name="Seller_fname"  size=25 maxlength=15
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e6e6e6;
								border-color: e6e6e6;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;" >
						</td>
					</tr>

					<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller Last Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<input type=text name="seller_lname"  size=25 maxlength=25
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e6e6e6;
								border-color: e6e6e6;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;" >
						</td>
					</tr> --->
		<!--- ================================================== --->
					</tr>




<!--- ======================================================================== --->

				</table>
		</TD>


			</TR>
			<table width=776 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=776 align=left valign=top colspan=2 bgcolor=elelel>
				<FONT FACE=ARIAL SIZE=2 color="blue">
				<CENTER><B>Advanced Reports</B><br>*Allow you to generate specific reports based on your company's needs</CENTER>
			</TD>
		</TR>

<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Loan Number -
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
							<input type=text name="loan_number" size=15 maxlength=15
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e6e6e6;
								border-color: e6e6e6;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;"
								>
						</td>
					</tr>


			<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Month
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
							<SELECT NAME="oda_month"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<OPTION VALUE="NONE">N/A</OPTION>

	   	<option value="1">January</option>
		<option value="2">February</option>
		<option value="3">March</option>
		<option value="4">April</option>
		<option value="5">May</option>
		<option value="6">June</option>
		<option value="7">July</option>
		<option value="8">August</option>
		<option value="9">September</option>
		<option value="10">October</option>
		<option value="11">November</option>
		<option value="12">December</option>
							</SELECT>
						</td>
					</tr>
					<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
									<SELECT NAME="Appraisal_status"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<OPTION VALUE="NONE">N/A</OPTION>
									 <option value="In Process" style="thin">In Process</OPTION>
	  <option value="In Typing">In Typing</OPTION>
	<option value="Report E-mailed" style="thin">Report E-mailed</OPTION>
	<option value="Report Faxed" style="thin" >Report Faxed</OPTION>
	<option value="Cancelled per client" style="thin">Cancelled per client</OPTION>
						</td>
					</tr>
						<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Comments
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
					<SELECT NAME="comments"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<OPTION VALUE="NONE">N/A</OPTION>
								 <option value="Court House Closed">Court House Closed</OPTION>
	  <option value="Waiting on Tax Info.">Waiting on Tax Info.</OPTION>
	  <option value="In Typing">In Typing</OPTION>
	  <option value="Waiting on Judgment Info">Waiting on Judgment Info</OPTION>
      <option value="Call for Detail">Call for Detail</OPTION>
	  <option value="Judgments Exist">Judgments Exist</OPTION>
	  <option value="Subordination Needed">Subordination Needed</OPTION>
	  <option value="Subordination Received">Subordination Received</OPTION>
	  <option value="Vesting Issue">Vesting Issue</OPTION>
	  <option value="Unreleased Mortgages Exists">Unreleased Mortgages Exists</OPTION>
	  <option value="Clear to Close">Clear to Close</OPTION></SELECT>
						</td>
					</tr>



<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Sort By
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
							<SELECT NAME="sortorder"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
<OPTION VALUE="NONE">N/A</OPTION>
<OPTION VALUE="oda_month">Month</OPTION>
<OPTION VALUE="Anc_id">Order Number</OPTION>
<OPTION VALUE="comments">Comments</OPTION>
<OPTION VALUE="appraisal_status">Status</OPTION>
<!--- <OPTION VALUE="User_ID">Loan Processor</OPTION> --->
</SELECT>
						</td>
					</tr>

					<tr>
						<td bgcolor=d3d3d3 colspan=2 width=600 align=right valign=top>
							<INPUT TYPE=image src="./images/button_search.gif" border=0>
						</td>

					</tr>
		</table>

<tr>
			<td width=776 align=left valign=top bgcolor=green>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Signing Report Search</B></CENTER>
			</TD>
		</TR>
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
</CFFORM>
			</TD>
		</TR>

	</table>


			</TD>
		</TR>

	</table>
	<cfelseif #a_trigger# eq "8">

	<CFFORM NAME="frm"  ACTION="./title_client_rep_display.cfm?emp=#emp#&comp_id=#comp_id#&calc=#calc#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&ordering_co=#ordering_co#" METHOD=POST>

	<table width=776 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td width=776 align=center valign=top bgcolor=e1e1e1>
		<FONT FACE=verdana SIZE=1 color="blUE">
							<B>SELECT A PRODUCT</b>
		</td></tr>
		<tr>
		<td width=776 align=center valign=top bgcolor=e1e1e1>

				<SELECT NAME="product"	onchange="prodSelect()"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<cfif #url.a_trigger# eq "1"><OPTION VALUE="title" selected>Title</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "2"><OPTION VALUE="property" selected>Property</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "3"><OPTION VALUE="appraisal" selected>Appraisal</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "4"><OPTION VALUE="flood" selected>Flood</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "5"><OPTION VALUE="credit" selected>Credit</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "6"><OPTION VALUE="avm" selected>AVM</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "7"><OPTION VALUE="signing" selected>Signing</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "8">
								<OPTION VALUE="all" selected>All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "10">
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "11">
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								
							<cfelse><OPTION VALUE="Closing" selected>Closing</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								</cfif>

							</SELECT>

	</td>
	</tr>
</table>

<br>
<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->

<table width=776 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=776 align=left valign=top bgcolor="gray">
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Product Report Search</B></CENTER>
			</TD>
		</TR>
		<tr>
			<td width=776 align=left valign=top bgcolor=elelel>
				<FONT FACE=ARIAL SIZE=2 color="blue">
				<CENTER><B>Please select below to find your order</B></CENTER>
			</TD>
		</TR>
<tr>
			<td width=776 align=center valign=top bgcolor=d3d3d3>


				<table width=600 cellpadding=1 cellspacing=1 border=0>


					<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower's First Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<input type=text name="buyer_fname" size=25 maxlength=15
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e6e6e6;
								border-color: e6e6e6;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;"
								>
						</td>
					</tr>
		<!--- ================================================== --->
					<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower's Last Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<input type=text name="buyer_lname"  size=25 maxlength=25
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e6e6e6;
								border-color: e6e6e6;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;"
								>
						</td>
					</tr>

					</tr>



				</table>
		</TD>


			</TR>
			<table width=776 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=776 align=left valign=top colspan=2 bgcolor=elelel>
				<FONT FACE=ARIAL SIZE=2 color="blue">
				<CENTER><B>Advanced Reports</B><br>*Allow you to generate specific reports based on your company's needs</CENTER>
			</TD>
		</TR>

<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Loan Number -
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
							<input type=text name="loan_number" size=15 maxlength=15
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e6e6e6;
								border-color: e6e6e6;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;"
								>
						</td>
					</tr>


			<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Month
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
							<SELECT NAME="oda_month"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<OPTION VALUE="NONE">N/A</OPTION>

	   	<option value="1">January</option>
		<option value="2">February</option>
		<option value="3">March</option>
		<option value="4">April</option>
		<option value="5">May</option>
		<option value="6">June</option>
		<option value="7">July</option>
		<option value="8">August</option>
		<option value="9">September</option>
		<option value="10">October</option>
		<option value="11">November</option>
		<option value="12">December</option>
							</SELECT>
						</td>
					</tr>
					<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
									<SELECT NAME="Appraisal_status"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<OPTION VALUE="NONE">N/A</OPTION>
									 <option value="In Process" style="thin">In Process</OPTION>
	  <option value="In Typing">In Typing</OPTION>
	<option value="Report E-mailed" style="thin">Report E-mailed</OPTION>
	<option value="Report Faxed" style="thin" >Report Faxed</OPTION>
	<option value="Cancelled per client" style="thin">Cancelled per client</OPTION>
						</td>
					</tr>
						<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Comments
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
							<SELECT NAME="comments"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<OPTION VALUE="NONE">N/A</OPTION>
								 <option value="Court House Closed">Court House Closed</OPTION>
	  <option value="Waiting on Tax Info.">Waiting on Tax Info.</OPTION>
	  <option value="In Typing">In Typing</OPTION>
	  <option value="Waiting on Judgment Info">Waiting on Judgment Info</OPTION>
      <option value="Call for Detail">Call for Detail</OPTION>
	  <option value="Judgments Exist">Judgments Exist</OPTION>
	  <option value="Subordination Needed">Subordination Needed</OPTION>
	  <option value="Subordination Received">Subordination Received</OPTION>
	  <option value="Vesting Issue">Vesting Issue</OPTION>
	  <option value="Unreleased Mortgages Exists">Unreleased Mortgages Exists</OPTION>
	  <option value="Clear to Close">Clear to Close</OPTION></SELECT>
						</td>
					</tr>

				<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Sort By
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
							<SELECT NAME="sortorder"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
<OPTION VALUE="NONE">N/A</OPTION>
<OPTION VALUE="oda_month">Month</OPTION>
<OPTION VALUE="comments">Comments</OPTION>
<OPTION VALUE="appraisal_status">Status</OPTION>

</SELECT>
						</td>
					</tr>
					<tr>
						<td bgcolor=d3d3d3 colspan=2 width=600 align=right valign=top>
							<INPUT TYPE=image src="./images/button_search.gif" border=0>
						</td>

					</tr>
		</table>

<tr>
			<td width=776 align=left valign=top bgcolor=gray>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Product Report Search</B></CENTER>
			</TD>
		</TR>
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
</CFFORM>
			</TD>
		</TR>

	</table>


			</TD>
		</TR>

	</table>

<cfelseif #a_trigger# eq 10>
	<CFFORM NAME="frm" ACTION="./title_client_rep_display.cfm?emp=#emp#&comp_id=#comp_id#&calc=#calc#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=10&ordering_co=#ordering_co#" METHOD=POST>

	<table width=776 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td width=776 align=center valign=top bgcolor=e1e1e1>
		<FONT FACE=verdana SIZE=1 color="blUE">
							<B>SELECT A PRODUCT</b>
		</td></tr>
		<tr>
		<td width=776 align=center valign=top bgcolor=e1e1e1>

		<SELECT NAME="product"	onchange="prodSelect()"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<cfif #url.a_trigger# eq "1"><OPTION VALUE="title" selected>Title</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "2"><OPTION VALUE="property" selected>Property</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "3"><OPTION VALUE="appraisal" selected>Appraisal</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "4"><OPTION VALUE="flood" selected>Flood</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "5"><OPTION VALUE="credit" selected>Credit</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "6"><OPTION VALUE="avm" selected>AVM</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "7"><OPTION VALUE="signing" selected>Signing</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "8">
								<OPTION VALUE="all" selected>All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "10">
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "11">
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								
							<cfelse><OPTION VALUE="Closing" selected>Closing</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								</cfif>

							</SELECT>

	</td>
	</tr>
</table>

<br>

<table width=776 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=776 align=left valign=top bgcolor="green">
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Final Document Retrieval Search</B></CENTER>
			</TD>
		</TR>
		<tr>
			<td width=776 align=left valign=top bgcolor=elelel>
				<FONT FACE=ARIAL SIZE=2 color="blue">
				<CENTER><B>Please select below to find your order</B></CENTER>
			</TD>
		</TR>
<tr>
			<td width=776 align=center valign=top bgcolor=d3d3d3>



				<table width=600 cellpadding=1 cellspacing=1 border=0>

							<tr>

					<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							FDR Number
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<SELECT NAME="fdr_id"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<OPTION VALUE="NONE">N/A</OPTION>
								<CFOUTPUT QUERY="read_titleid_fdr"><OPTION VALUE="#FDR_ID#">#FDR_ID#</OPTION></CFOUTPUT>
							</SELECT>
						</td>
					</tr>

					<!--- <tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Clients
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<SELECT NAME="company_id"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<OPTION VALUE="NONE">N/A</OPTION>
								<CFOUTPUT QUERY="read_companies"><OPTION VALUE="#ID#">#Company#</OPTION></CFOUTPUT>
							</SELECT>
						</td>
					</tr> --->
		<!--- ================================================== --->
					<!--- <tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Loan Processors
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<SELECT NAME="user_id"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<OPTION VALUE="NONE">N/A</OPTION>
				<CFOUTPUT>
					<CFLOOP FROM="1" TO="#ArrayLen(a_company_name)#" INDEX="AAA">
						<CFIF #a_rec_count[AAA]# NEQ "0">
							<OPTION VALUE="NONE">------------------------------------</OPTION>

							<OPTION VALUE="NONE">#a_company_name[AAA]#</OPTION>
							<CFLOOP FROM="1" TO="#a_rec_count[AAA]#" INDEX="BBB">
								<cfset user_id = #users_id[AAA][BBB]#>
								<OPTION VALUE="#user_id#">&nbsp;&nbsp;--&nbsp;&nbsp;&nbsp;#users_lname[AAA][BBB]#,  #users_fname[AAA][BBB]#</OPTION>
							</CFLOOP>
							<OPTION VALUE="NONE"></OPTION>
						</CFIF>
					</CFLOOP>
				</CFOUTPUT>

							</SELECT>
						</td>
					</tr> --->
		<!--- ================================================== --->

					<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower's First Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<input type=text name="buyer_fname" size=25 maxlength=15
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e6e6e6;
								border-color: e6e6e6;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;"
								>
						</td>
					</tr>
		<!--- ================================================== --->
					<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower's Last Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<input type=text name="buyer_lname"  size=25 maxlength=25
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e6e6e6;
								border-color: e6e6e6;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;"
								>
						</td>
					</tr>
		<!--- ================================================== --->
			<!--- 		<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller First Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<input type=text name="Seller_fname"  size=25 maxlength=15
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e6e6e6;
								border-color: e6e6e6;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;" >
						</td>
					</tr>

					<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller Last Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<input type=text name="seller_lname"  size=25 maxlength=25
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e6e6e6;
								border-color: e6e6e6;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;" >
						</td>
					</tr> --->
		<!--- ================================================== --->
					</tr>




<!--- ======================================================================== --->

				</table>
		</TD>


			</TR>
			<table width=776 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=776 align=left valign=top colspan=2 bgcolor=elelel>
				<FONT FACE=ARIAL SIZE=2 color="blue">
				<CENTER><B>Advanced Reports</B><br>*Allow you to generate specific reports based on your company's needs</CENTER>
			</TD>
		</TR>

<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Loan Number -
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
							<input type=text name="loan_number" size=15 maxlength=15
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e6e6e6;
								border-color: e6e6e6;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;"
								>
						</td>
					</tr>


<!--- 			<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Month
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
							<SELECT NAME="oda_month"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<OPTION VALUE="NONE">N/A</OPTION>

	   	<option value="1">January</option>
		<option value="2">February</option>
		<option value="3">March</option>
		<option value="4">April</option>
		<option value="5">May</option>
		<option value="6">June</option>
		<option value="7">July</option>
		<option value="8">August</option>
		<option value="9">September</option>
		<option value="10">October</option>
		<option value="11">November</option>
		<option value="12">December</option>
							</SELECT>
						</td>
					</tr> --->
					<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
									<SELECT NAME="Appraisal_status"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<OPTION VALUE="NONE">N/A</OPTION>
									 <option value="Order Received" style="thin">Order Received</OPTION>
	<option value="Cancelled per client" style="thin">Cancelled per client</OPTION>
						</td>
					</tr>
						<!--- <tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Comments
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
					<SELECT NAME="comments"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<OPTION VALUE="NONE">N/A</OPTION>
								 <option value="Court House Closed">Court House Closed</OPTION>
	  <option value="Waiting on Tax Info.">Waiting on Tax Info.</OPTION>
	  <option value="In Typing">In Typing</OPTION>
	  <option value="Waiting on Judgment Info">Waiting on Judgment Info</OPTION>
      <option value="Call for Detail">Call for Detail</OPTION>
	  <option value="Judgments Exist">Judgments Exist</OPTION>
	  <option value="Subordination Needed">Subordination Needed</OPTION>
	  <option value="Subordination Received">Subordination Received</OPTION>
	  <option value="Vesting Issue">Vesting Issue</OPTION>
	  <option value="Unreleased Mortgages Exists">Unreleased Mortgages Exists</OPTION>
	  <option value="Clear to Close">Clear to Close</OPTION></SELECT>
						</td>
					</tr> --->



<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Sort By
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
							<SELECT NAME="sortorder"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
<OPTION VALUE="NONE">N/A</OPTION>
<OPTION VALUE="oda_month">Month</OPTION>
<OPTION VALUE="FDR_id">Order Number</OPTION>
<OPTION VALUE="appraisal_status">Status</OPTION>
<!--- <OPTION VALUE="User_ID">Loan Processor</OPTION> --->
</SELECT>
						</td>
					</tr>

					<tr>
						<td bgcolor=d3d3d3 colspan=2 width=600 align=right valign=top>
							<INPUT TYPE=image src="./images/button_search.gif" border=0>
						</td>

					</tr>
		</table>

<tr>
			<td width=776 align=left valign=top bgcolor=green>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Final Document Retrieval Search</B></CENTER>
			</TD>
		</TR>
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
</CFFORM>
			</TD>
		</TR>

	</table>


			</TD>
		</TR>

	</table>
	
	
	
<cfelseif #a_trigger# eq 11>
	<CFFORM NAME="frm" ACTION="./title_client_rep_display.cfm?emp=#emp#&comp_id=#comp_id#&calc=#calc#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=11&ordering_co=#ordering_co#" METHOD=POST>

	<table width=776 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td width=776 align=center valign=top bgcolor=e1e1e1>
		<FONT FACE=verdana SIZE=1 color="blUE">
							<B>SELECT A PRODUCT</b>
		</td></tr>
		<tr>
		<td width=776 align=center valign=top bgcolor=e1e1e1>

		<SELECT NAME="product"	onchange="prodSelect()"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<cfif #url.a_trigger# eq "1"><OPTION VALUE="title" selected>Title</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "2"><OPTION VALUE="property" selected>Property</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "3"><OPTION VALUE="appraisal" selected>Appraisal</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "4"><OPTION VALUE="flood" selected>Flood</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "5"><OPTION VALUE="credit" selected>Credit</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "6"><OPTION VALUE="avm" selected>AVM</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "7"><OPTION VALUE="signing" selected>Signing</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "8">
								<OPTION VALUE="all" selected>All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "10">
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "11">
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								
							<cfelse><OPTION VALUE="Closing" selected>Closing</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								</cfif>

							</SELECT>

	</td>
	</tr>
</table>

<br>

<table width=776 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=776 align=left valign=top bgcolor="green">
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Policy Recovery Search</B></CENTER>
			</TD>
		</TR>
		<tr>
			<td width=776 align=left valign=top bgcolor=elelel>
				<FONT FACE=ARIAL SIZE=2 color="blue">
				<CENTER><B>Please select below to find your order</B></CENTER>
			</TD>
		</TR>
<tr>
			<td width=776 align=center valign=top bgcolor=d3d3d3>



				<table width=600 cellpadding=1 cellspacing=1 border=0>

							<tr>

					<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							PR Number
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<SELECT NAME="pr_id"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<OPTION VALUE="NONE">N/A</OPTION>
								<CFOUTPUT QUERY="read_titleid_pr"><OPTION VALUE="#PR_ID#">#PR_ID#</OPTION></CFOUTPUT>
							</SELECT>
						</td>
					</tr>

					<!--- <tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Clients
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<SELECT NAME="company_id"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<OPTION VALUE="NONE">N/A</OPTION>
								<CFOUTPUT QUERY="read_companies"><OPTION VALUE="#ID#">#Company#</OPTION></CFOUTPUT>
							</SELECT>
						</td>
					</tr> --->
		<!--- ================================================== --->
					<!--- <tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Loan Processors
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<SELECT NAME="user_id"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<OPTION VALUE="NONE">N/A</OPTION>
				<CFOUTPUT>
					<CFLOOP FROM="1" TO="#ArrayLen(a_company_name)#" INDEX="AAA">
						<CFIF #a_rec_count[AAA]# NEQ "0">
							<OPTION VALUE="NONE">------------------------------------</OPTION>

							<OPTION VALUE="NONE">#a_company_name[AAA]#</OPTION>
							<CFLOOP FROM="1" TO="#a_rec_count[AAA]#" INDEX="BBB">
								<cfset user_id = #users_id[AAA][BBB]#>
								<OPTION VALUE="#user_id#">&nbsp;&nbsp;--&nbsp;&nbsp;&nbsp;#users_lname[AAA][BBB]#,  #users_fname[AAA][BBB]#</OPTION>
							</CFLOOP>
							<OPTION VALUE="NONE"></OPTION>
						</CFIF>
					</CFLOOP>
				</CFOUTPUT>

							</SELECT>
						</td>
					</tr> --->
		<!--- ================================================== --->

					<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower's First Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<input type=text name="buyer_fname" size=25 maxlength=15
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e6e6e6;
								border-color: e6e6e6;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;"
								>
						</td>
					</tr>
		<!--- ================================================== --->
					<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower's Last Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<input type=text name="buyer_lname"  size=25 maxlength=25
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e6e6e6;
								border-color: e6e6e6;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;"
								>
						</td>
					</tr>
		<!--- ================================================== --->
			<!--- 		<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller First Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<input type=text name="Seller_fname"  size=25 maxlength=15
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e6e6e6;
								border-color: e6e6e6;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;" >
						</td>
					</tr>

					<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller Last Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<input type=text name="seller_lname"  size=25 maxlength=25
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e6e6e6;
								border-color: e6e6e6;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;" >
						</td>
					</tr> --->
		<!--- ================================================== --->
					</tr>




<!--- ======================================================================== --->

				</table>
		</TD>


			</TR>
			<table width=776 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=776 align=left valign=top colspan=2 bgcolor=elelel>
				<FONT FACE=ARIAL SIZE=2 color="blue">
				<CENTER><B>Advanced Reports</B><br>*Allow you to generate specific reports based on your company's needs</CENTER>
			</TD>
		</TR>

<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Loan Number -
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
							<input type=text name="loan_number" size=15 maxlength=15
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e6e6e6;
								border-color: e6e6e6;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;"
								>
						</td>
					</tr>


			<!--- <tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Month
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
							<SELECT NAME="oda_month"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<OPTION VALUE="NONE">N/A</OPTION>

	   	<option value="1">January</option>
		<option value="2">February</option>
		<option value="3">March</option>
		<option value="4">April</option>
		<option value="5">May</option>
		<option value="6">June</option>
		<option value="7">July</option>
		<option value="8">August</option>
		<option value="9">September</option>
		<option value="10">October</option>
		<option value="11">November</option>
		<option value="12">December</option>
							</SELECT>
						</td>
					</tr> --->
					<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
									<SELECT NAME="Appraisal_status"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<OPTION VALUE="NONE">N/A</OPTION>
									 <option value="Order Received" style="thin">Order Received</OPTION>
	<option value="Cancelled per client" style="thin">Cancelled per client</OPTION>
						</td>
					</tr>
						<!--- <tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Comments
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
					<SELECT NAME="comments"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<OPTION VALUE="NONE">N/A</OPTION>
								 <option value="Court House Closed">Court House Closed</OPTION>
	  <option value="Waiting on Tax Info.">Waiting on Tax Info.</OPTION>
	  <option value="In Typing">In Typing</OPTION>
	  <option value="Waiting on Judgment Info">Waiting on Judgment Info</OPTION>
      <option value="Call for Detail">Call for Detail</OPTION>
	  <option value="Judgments Exist">Judgments Exist</OPTION>
	  <option value="Subordination Needed">Subordination Needed</OPTION>
	  <option value="Subordination Received">Subordination Received</OPTION>
	  <option value="Vesting Issue">Vesting Issue</OPTION>
	  <option value="Unreleased Mortgages Exists">Unreleased Mortgages Exists</OPTION>
	  <option value="Clear to Close">Clear to Close</OPTION></SELECT>
						</td>
					</tr> --->



<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Sort By
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
							<SELECT NAME="sortorder"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
<OPTION VALUE="NONE">N/A</OPTION>
<OPTION VALUE="oda_month">Month</OPTION>
<OPTION VALUE="FDR_id">Order Number</OPTION>
<OPTION VALUE="appraisal_status">Status</OPTION>
<!--- <OPTION VALUE="User_ID">Loan Processor</OPTION> --->
</SELECT>
						</td>
					</tr>

					<tr>
						<td bgcolor=d3d3d3 colspan=2 width=600 align=right valign=top>
							<INPUT TYPE=image src="./images/button_search.gif" border=0>
						</td>

					</tr>
		</table>

<tr>
			<td width=776 align=left valign=top bgcolor=green>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Policy Recovery Search</B></CENTER>
			</TD>
		</TR>
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
</CFFORM>
			</TD>
		</TR>

	</table>


			</TD>
		</TR>

	</table>
	
	
	<cfelse>

	<CFFORM NAME="frm"  ACTION="./title_client_rep_display.cfm?emp=#emp#&comp_id=#comp_id#&calc=#calc#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=9&ordering_co=#ordering_co#" METHOD=POST>

	<table width=776 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td width=776 align=center valign=top bgcolor=e1e1e1>
		<FONT FACE=verdana SIZE=1 color="blUE">
							<B>SELECT A PRODUCT</b>
		</td></tr>
		<tr>
		<td width=776 align=center valign=top bgcolor=e1e1e1>

				<SELECT NAME="product"	onchange="prodSelect()"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<cfif #url.a_trigger# eq "1"><OPTION VALUE="title" selected>Title</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "2"><OPTION VALUE="property" selected>Property</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "3"><OPTION VALUE="appraisal" selected>Appraisal</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "4"><OPTION VALUE="flood" selected>Flood</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "5"><OPTION VALUE="credit" selected>Credit</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "6"><OPTION VALUE="avm" selected>AVM</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "7"><OPTION VALUE="signing" selected>Signing</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "8">
								<OPTION VALUE="all" selected>All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "10">
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<cfelseif #url.a_trigger# eq "11">
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="Closing">Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								
							<cfelse><OPTION VALUE="Closing" selected>Closing</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="final_document_retrieval">Final Document Retrieval</OPTION>
								<OPTION VALUE="policy_recovery">Policy Recovery</OPTION>
								</cfif>

							</SELECT>

	</td>
	</tr>
</table>

<br>
<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->

<table width=776 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=776 align=left valign=top bgcolor="black">
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Product Report Search</B></CENTER>
			</TD>
		</TR>
		<tr>
			<td width=776 align=left valign=top bgcolor=elelel>
				<FONT FACE=ARIAL SIZE=2 color="blue">
				<CENTER><B>Please select below to find your order</B></CENTER>
			</TD>
		</TR>
<tr>
			<td width=776 align=center valign=top bgcolor=d3d3d3>


				<table width=600 cellpadding=1 cellspacing=1 border=0>


											<tr>

					<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Title Number
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<SELECT NAME="Title_id"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<OPTION VALUE="NONE">N/A</OPTION>
								<CFOUTPUT QUERY="read_titleidclosing"><OPTION VALUE="#Title_ID#">#Title_ID#</OPTION></CFOUTPUT>
							</SELECT>
						</td>
					</tr>



					<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower's First Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<input type=text name="buyer_fname" size=25 maxlength=15
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e6e6e6;
								border-color: e6e6e6;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;"
								>
						</td>
					</tr>
		<!--- ================================================== --->
					<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower's Last Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<input type=text name="buyer_lname"  size=25 maxlength=25
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e6e6e6;
								border-color: e6e6e6;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;"
								>
						</td>
					</tr>

					</tr>



				</table>
		</TD>


			</TR>
			<table width=776 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=776 align=left valign=top colspan=2 bgcolor=elelel>
				<FONT FACE=ARIAL SIZE=2 color="blue">
				<CENTER><B>Advanced Reports</B><br>*Allow you to generate specific reports based on your company's needs</CENTER>
			</TD>
		</TR>

					<tr>

						<td bgcolor=d3d3d3 width=776 colspan = 2 align=center valign=top><br>
							<B>FROM</B>
		<select name="confirm_mon" onchange="monthresult()"

											size="1"
											style="font-size: 9;
											font-family: verdana;
											font-style: normal;
											color: BLUE;
											background-color: E4E3E3;
											border-color: white;
											border-left-width: thin;
											border-right-width: thin;
											border-top-width: thin;
											border-bottom-width: thin;
											border-width: thin;
											border-style: bar;
											clear: none;
											float: none;"
											rows="3"
											cols="45"
											>
<option value="Month">Month</option>


	   	<option value="01">January</option>
		<option value="02">February</option>
		<option value="03">March</option>
		<option value="04">April</option>
		<option value="05">May</option>
		<option value="06">June</option>
		<option value="07">July</option>
		<option value="08">August</option>
		<option value="09">September</option>
		<option value="10">October</option>
		<option value="11">November</option>
		<option value="12">December</option>


</select>

<select name="comfirm_day" onchange="dayresult()"
size="1"
											style="font-size: 9;
											font-family: verdana;
											font-style: normal;
											color: BLUE;
											background-color: E4E3E3;
											border-color: white;
											border-left-width: thin;
											border-right-width: thin;
											border-top-width: thin;
											border-bottom-width: thin;
											border-width: thin;
											border-style: bar;
											clear: none;
											float: none;"
											rows="3"
											cols="45"
											>



<OPTION VALUE="Day">Day</OPTION>


		<OPTION VALUE="01">01</OPTION>
		<OPTION VALUE="02">02</OPTION>
		<OPTION VALUE="03">03</OPTION>
		<OPTION VALUE="04">04</OPTION>
		<OPTION VALUE="05">05</OPTION>
		<OPTION VALUE="06">06</OPTION>
		<OPTION VALUE="07">07</OPTION>
		<OPTION VALUE="08">08</OPTION>
		<OPTION VALUE="09">09</OPTION>
		<OPTION VALUE="10">10</OPTION>
		<OPTION VALUE="11">11</OPTION>
		<OPTION VALUE="12">12</OPTION>
		<OPTION VALUE="13">13</OPTION>
		<OPTION VALUE="14">14</OPTION>
		<OPTION VALUE="15">15</OPTION>
		<OPTION VALUE="16">16</OPTION>
		<OPTION VALUE="17">17</OPTION>
		<OPTION VALUE="18">18</OPTION>
		<OPTION VALUE="19">19</OPTION>
		<OPTION VALUE="20">20</OPTION>
		<OPTION VALUE="21">21</OPTION>
		<OPTION VALUE="22">22</OPTION>
		<OPTION VALUE="23">23</OPTION>
		<OPTION VALUE="24">24</OPTION>
		<OPTION VALUE="25">25</OPTION>
		<OPTION VALUE="26">26</OPTION>
		<OPTION VALUE="27">27</OPTION>
		<OPTION VALUE="28">28</OPTION>
		<OPTION VALUE="29">29</OPTION>
		<OPTION VALUE="30">30</OPTION>
		<OPTION VALUE="31">31</OPTION>
</select>
<select name="confirm_year" onchange="yearresult()"
size="1"
											style="font-size: 9;
											font-family: verdana;
											font-style: normal;
											color: BLUE;
											background-color: E4E3E3;
											border-color: white;
											border-left-width: thin;
											border-right-width: thin;
											border-top-width: thin;
											border-bottom-width: thin;
											border-width: thin;
											border-style: bar;
											clear: none;
											float: none;"
											rows="3"
											cols="45"
											>



<option value="Year">Year</option>



	   	<option value="2000">2000</option>
		<option value="2001">2001</option>
		<option value="2002">2002</option>
		<option value="2003">2003</option>
		<option value="2004">2004</option>
		<option value="2005">2005</option>
		<option value="2006">2006</option>
		<option value="2007">2007</option>
		<option value="2008">2008</option>
		<option value="2009">2009</option>
		<option value="2010">2010</option>
		<option value="2011">2011</option>
		<option value="2012">2012</option>
		<option value="2013">2013</option>
		<option value="2014">2014</option>
		<option value="2015">2015</option>
		<option value="2016">2016</option>
		<option value="2017">2017</option>
		<option value="2018">2018</option>
		<option value="2019">2019</option>
		<option value="2020">2020</option>
		</select>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <B>TO</B>

		<select name="confirm_mon_to"
		size="1"
											style="font-size: 9;
											font-family: verdana;
											font-style: normal;
											color: BLUE;
											background-color: E4E3E3;
											border-color: white;
											border-left-width: thin;
											border-right-width: thin;
											border-top-width: thin;
											border-bottom-width: thin;
											border-width: thin;
											border-style: bar;
											clear: none;
											float: none;"
											rows="3"
											cols="45"
											>

<option value="Month">Month</option>


	   	<option value="01">January</option>
		<option value="02">February</option>
		<option value="03">March</option>
		<option value="04">April</option>
		<option value="05">May</option>
		<option value="06">June</option>
		<option value="07">July</option>
		<option value="08">August</option>
		<option value="09">September</option>
		<option value="10">October</option>
		<option value="11">November</option>
		<option value="12">December</option>


</select>

<select name="comfirm_day_to"
size="1"
											style="font-size: 9;
											font-family: verdana;
											font-style: normal;
											color: BLUE;
											background-color: E4E3E3;
											border-color: white;
											border-left-width: thin;
											border-right-width: thin;
											border-top-width: thin;
											border-bottom-width: thin;
											border-width: thin;
											border-style: bar;
											clear: none;
											float: none;"
											rows="3"
											cols="45"
											>



<OPTION VALUE="Day">Day</OPTION>


		<OPTION VALUE="01">01</OPTION>
		<OPTION VALUE="02">02</OPTION>
		<OPTION VALUE="03">03</OPTION>
		<OPTION VALUE="04">04</OPTION>
		<OPTION VALUE="05">05</OPTION>
		<OPTION VALUE="06">06</OPTION>
		<OPTION VALUE="07">07</OPTION>
		<OPTION VALUE="08">08</OPTION>
		<OPTION VALUE="09">09</OPTION>
		<OPTION VALUE="10">10</OPTION>
		<OPTION VALUE="11">11</OPTION>
		<OPTION VALUE="12">12</OPTION>
		<OPTION VALUE="13">13</OPTION>
		<OPTION VALUE="14">14</OPTION>
		<OPTION VALUE="15">15</OPTION>
		<OPTION VALUE="16">16</OPTION>
		<OPTION VALUE="17">17</OPTION>
		<OPTION VALUE="18">18</OPTION>
		<OPTION VALUE="19">19</OPTION>
		<OPTION VALUE="20">20</OPTION>
		<OPTION VALUE="21">21</OPTION>
		<OPTION VALUE="22">22</OPTION>
		<OPTION VALUE="23">23</OPTION>
		<OPTION VALUE="24">24</OPTION>
		<OPTION VALUE="25">25</OPTION>
		<OPTION VALUE="26">26</OPTION>
		<OPTION VALUE="27">27</OPTION>
		<OPTION VALUE="28">28</OPTION>
		<OPTION VALUE="29">29</OPTION>
		<OPTION VALUE="30">30</OPTION>
		<OPTION VALUE="31">31</OPTION>
</select>
<select name="confirm_year_to"
size="1"
											style="font-size: 9;
											font-family: verdana;
											font-style: normal;
											color: BLUE;
											background-color: E4E3E3;
											border-color: white;
											border-left-width: thin;
											border-right-width: thin;
											border-top-width: thin;
											border-bottom-width: thin;
											border-width: thin;
											border-style: bar;
											clear: none;
											float: none;"
											rows="3"
											cols="45"
											>



<option value="Year">Year</option>



	   	<option value="2000">2000</option>
		<option value="2001">2001</option>
		<option value="2002">2002</option>
		<option value="2003">2003</option>
		<option value="2004">2004</option>
		<option value="2005">2005</option>
		<option value="2006">2006</option>
		<option value="2007">2007</option>
		<option value="2008">2008</option>
		<option value="2009">2009</option>
		<option value="2010">2010</option>
		<option value="2011">2011</option>
		<option value="2012">2012</option>
		<option value="2013">2013</option>
		<option value="2014">2014</option>
		<option value="2015">2015</option>
		<option value="2016">2016</option>
		<option value="2017">2017</option>
		<option value="2018">2018</option>
		<option value="2019">2019</option>
		<option value="2020">2020</option>
		</select>
		<br>	<br>
						</td>

					</tr>


<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Loan Number -
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
							<input type=text name="loan_number" size=15 maxlength=15
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e6e6e6;
								border-color: e6e6e6;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;"
								>
						</td>
					</tr>



					<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
									<SELECT NAME="Appraisal_status"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<OPTION VALUE="NONE">N/A</OPTION>
									 <option value="Closing Requested" style="thin">Closings Requested</OPTION>
	  <option value="Closing Scheduled">Closings Scheduled</OPTION>
	<option value="Loan Closed" style="thin">Loan Closed</OPTION>

						</td>
					</tr>
						<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Comments
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
							<SELECT NAME="comments"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<OPTION VALUE="NONE">N/A</OPTION>
								 <option value="Court House Closed">Court House Closed</OPTION>
	  <option value="Waiting on Tax Info.">Waiting on Tax Info.</OPTION>
	  <option value="In Typing">In Typing</OPTION>
	  <option value="Waiting on Judgment Info">Waiting on Judgment Info</OPTION>
      <option value="Call for Detail">Call for Detail</OPTION>
	  <option value="Judgments Exist">Judgments Exist</OPTION>
	  <option value="Subordination Needed">Subordination Needed</OPTION>
	  <option value="Subordination Received">Subordination Received</OPTION>
	  <option value="Vesting Issue">Vesting Issue</OPTION>
	  <option value="Unreleased Mortgages Exists">Unreleased Mortgages Exists</OPTION>
	  <option value="Clear to Close">Clear to Close</OPTION></SELECT>
						</td>
					</tr>

				<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Sort By
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
							<SELECT NAME="sortorder"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
<OPTION VALUE="NONE">N/A</OPTION>
<OPTION VALUE="comments">Comments</OPTION>
<OPTION VALUE="appraisal_status">Status</OPTION>

</SELECT>
						</td>
					</tr>
					<tr>
						<td bgcolor=d3d3d3 colspan=2 width=600 align=right valign=top>
							<INPUT TYPE=image src="./images/button_search.gif" border=0>
						</td>

					</tr>
		</table>

<tr>
			<td width=776 align=left valign=top bgcolor=black>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Product Report Search</B></CENTER>
			</TD>
		</TR>
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
</CFFORM>
			</TD>
		</TR>

	</table>


			</TD>
		</TR>

	</table>




	</cfif>

			</td>

			<!--- <tr><td width=776 align=left valign=bottom><IMG src="./images/bottom.gif" width = "776"></td></tr></TBODY></TABLE>
  --->
			</tr></tbody></table>

<script type="text/javascript">



  var _gaq = _gaq || [];

  _gaq.push(['_setAccount', 'UA-195021-17']);

  _gaq.push(['_trackPageview']);



  (function() {

    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;

    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'https://www') + '.google-analytics.com/ga.js';

    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);

  })();



</script>

</body>
</HTML>


