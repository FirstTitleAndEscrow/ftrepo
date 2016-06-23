
<cfparam name="max_orders_per_day" default=10>
<cfset todays_date = CreateODBCDateTime(Now())>
<cfset rec_id = get_titleid.title_ID>

<!--- 184 is First Title In House --->

<!--- <CFQUERY datasource="#request.dsn#" name="get_abs" maxrows="1">		
	Select * from Zip_info
	where county = '#pcounty#' and state = '#pstate#'
</CFQUERY>

<cfif get_abs.pref_ab1_count LT max_orders_per_day OR get_abs.PREF_ABSTRACTOR1 eq 184>
<cfset assign_abstractor_id = get_abs.PREF_ABSTRACTOR1>
 <!--- assign abstractor1 here --->
<cfset ab1_count = get_abs.pref_ab1_count + 1>
<CFQUERY datasource="#request.dsn#" name="update_abs">		
	Update Zip_info
	set pref_ab1_count = #ab1_count#
	where county = '#pcounty#' and state = '#pstate#'
</CFQUERY>
<cfelse>
   <cfif get_abs.pref_ab2_count LT max_orders_per_day OR get_abs.PREF_ABSTRACTOR2 eq 184>
   <cfset assign_abstractor_id = get_abs.PREF_ABSTRACTOR2>
   <!--- assign abstractor2 here --->
   <cfset ab2_count = get_abs.pref_ab2_count + 1>
   <CFQUERY datasource="#request.dsn#" name="update_abs">		
	Update Zip_info
	set pref_ab2_count = #ab2_count#
	where county = '#pcounty#' and state = '#pstate#'
    </CFQUERY>
   <cfelse>
       <cfif get_abs.pref_ab3_count LT max_orders_per_day OR get_abs.PREF_ABSTRACTOR3 eq 184>
       <cfset assign_abstractor_id = get_abs.PREF_ABSTRACTOR3>
	   <!--- assign abstractor3 here --->
	   <cfset ab3_count = get_abs.pref_ab3_count + 1>
	   <CFQUERY datasource="#request.dsn#" name="update_abs">		
	   Update Zip_info
	   set pref_ab3_count = #ab3_count#
	   where county = '#pcounty#' and state = '#pstate#'
       </CFQUERY>
       <cfelse>
        <cfset assign_abstractor_id = get_abs.PREF_ABSTRACTOR1>
		<!--- assign abstractor1 here --->
		<cfset ab1_count = get_abs.pref_ab1_count + 1>
		<CFQUERY datasource="#request.dsn#" name="update_abs">		
		Update Zip_info
		set pref_ab1_count = #ab1_count#
		where county = '#pcounty#' and state = '#pstate#'
		</CFQUERY>
       </cfif>
   </cfif>
</cfif> --->



<!--- this next chunk basically bypasses all of the 'preferred abstractor' stuff. If the county/state is listed as in-house, then abstractorID will be set to 185 and it will be assigned to amit, otherwise nothing happens and it just waits for Shelly to reassign --->
<cfset assign_abstractor_id = 0>
<CFQUERY datasource="#request.dsn#" name="is_this_inhouse">	
 SELECT st_abbrev, ct_name
			FROM Abstractors_county
			WHERE Abstractor_ID = 184
			and st_abbrev = '#pstate#' and ct_name = '#pcounty#'
			ORDER BY st_abbrev ASC, ct_name ASC
</cfquery>

<cfif is_this_inhouse.recordcount neq 0>
<cfset assign_abstractor_id = 184>
</cfif>



<CFQUERY datasource="#request.dsn#" name="is_this_ESS">	
 SELECT st_abbrev, ct_name
			FROM Abstractors_county
			WHERE Abstractor_ID = 2362
			and st_abbrev = '#pstate#' and ct_name = '#pcounty#'
			ORDER BY st_abbrev ASC, ct_name ASC
</cfquery>

<cfif is_this_ESS.recordcount neq 0 and getcompany.id eq 3513>
<cfset assign_abstractor_id = 2362>
</cfif>

<!--- END  this next chunk basically bypasses all of the 'preferred abstractor' stuff. If the county/state is listed as in-house, then abstractorID will be set to 185 and it will be assigned to amit, otherwise nothing happens and it jusy waits for Shelly to reassign --->

<!--- this part auotassigns all DE files to Abstractor ID 2386 and all CT files to AbstractorID to 2389 --->
<!--- <cfif pstate eq 'DE'>
<cfset assign_abstractor_id = 2386>
<cfelseif pstate eq 'CT'>
<cfset assign_abstractor_id = 2389>
</cfif>
 --->

<cfif pstate eq 'DE'>
<cfset assign_abstractor_id = 2386>
<cfelseif pstate eq 'CT'>
<cfset assign_abstractor_id = 184>
<cfelseif pstate eq 'MD' and getcompany.streamline_client eq 'True' and (getcompany.ID eq 2372 or getcompany.ID eq  3568)>
<cfset assign_abstractor_id = 2390>
<cfelseif pstate eq 'VA' and getcompany.streamline_client eq 'True' and (pcounty eq 'Fairfax' or pcounty eq 'Prince William' or pcounty eq 'Virginia Beach') and (getcompany.ID eq 2372 or getcompany.ID eq  3568)>
<cfset assign_abstractor_id = 2390>
</cfif>

<!--- <cfif cgi.REMOTE_ADDR eq '98.233.55.8'>
got here!<br>
<cfoutput>assign_abstractor_id = #assign_abstractor_id#</cfoutput>
<cfabort>
</cfif>
 --->
<cfif assign_abstractor_id eq 184>
<CFQUERY datasource="#request.dsn#" name="update_abs">		
	Insert into Abstractors_Assigned (Order_ID, Order_Type, Assigned_Date, Abstractor_ID)
	values
	(#rec_id#, 'T', #todays_date#, #assign_abstractor_id#)
</CFQUERY>
</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_abs">		
			select * from abstractors
			WHERE abstractor_ID = #assign_abstractor_id#		
		</CFQUERY>
		
<CFQUERY datasource="#request.dsn#" NAME="read_user">	
			select * from first_admin
			WHERE ID = 77 <!--- 77 is Shelly Brown's user ID --->		
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="record_check">	
			Select * FROM Doc_Abstract_Title
			WHERE title_ID = #rec_ID#		
</CFQUERY>

<cfif record_check.recordcount eq 0>
<CFQUERY datasource="#request.dsn#" NAME="insert_new_record">	
			Insert into Doc_Abstract_Title
			(title_id)
			values
			(#rec_id#)
</CFQUERY>
</cfif>
<cfif assign_abstractor_id eq 184>
<CFSET order_date_adj = '#DateFormat(Now(), "mm/dd/yyyy")# #TimeFormat(Now(), "HH:mm:ss")#'>

<CFQUERY datasource="#request.dsn#" NAME="read_title_abs">	
			UPDATE Doc_Abstract_Title
			SET Abstractor_ID = #assign_abstractor_id#,
			a_Assigned_by = 77,
			company = '#read_abs.company#',
			a_Date_Assigned = '#DateFormat(Now(), "mm/dd/yyyy")#',
			a_Dateandtime = '#order_date_adj#',
			a_Time_Assigned = '#TimeFormat(Now(), "HH:mm:ss")#',
			abs_type = 1
			WHERE title_ID = #rec_ID#
		</CFQUERY>
</cfif>
<cfif assign_abstractor_id eq 184>
<CFQUERY datasource="#request.dsn#">		
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('#read_user.FName#', '#read_user.LName#', #rec_id#, 'Abstract will be done in-house.', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')		
</CFQUERY>	

<CFset read_abs.email = "akumar@firsttitleservices.com">
<cfinclude template="abstractor_auto_email.cfm">
<cfelse>


<cfif assign_abstractor_id eq 2362 or assign_abstractor_id eq 2386 or assign_abstractor_id eq 2389>
<CFQUERY datasource="#request.dsn#" NAME="read_abs">		
			select * from abstractors
			WHERE abstractor_ID = #assign_abstractor_id#		
		</CFQUERY>
		
<CFQUERY datasource="#request.dsn#" NAME="read_user">	
			select * from first_admin
			WHERE ID = 77 <!--- 77 is Shelly Brown's user ID --->		
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="record_check">	
			Select * FROM Doc_Abstract_Title
			WHERE title_ID = #rec_ID#		
</CFQUERY>

<cfif record_check.recordcount eq 0>
<CFQUERY datasource="#request.dsn#" NAME="insert_new_record">	
			Insert into Doc_Abstract_Title
			(title_id)
			values
			(#rec_id#)
</CFQUERY>
</cfif>
<CFQUERY datasource="#request.dsn#">		
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('#read_user.FName#', '#read_user.LName#', #rec_id#, 'Abstract Assigned to Vendor', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')		
		</CFQUERY>	
</cfif>
	
<CFSET order_date_adj = '#DateFormat(Now(), "mm/dd/yyyy")# #TimeFormat(Now(), "HH:mm:ss")#'>

<CFQUERY datasource="#request.dsn#" NAME="read_title_abs">	
			UPDATE Doc_Abstract_Title
			SET Abstractor_ID = #assign_abstractor_id#,
			a_Assigned_by = 77,
			company = '#read_abs.company#',
			a_Date_Assigned = '#DateFormat(Now(), "mm/dd/yyyy")#',
			a_Dateandtime = '#order_date_adj#',
			a_Time_Assigned = '#TimeFormat(Now(), "HH:mm:ss")#',
			abs_type = 1
			WHERE title_ID = #rec_ID#
		</CFQUERY>	
	
<cfif read_abs.email neq "">
<CFQUERY datasource="#request.dsn#" NAME="get_comp">
			select * from companies
			WHERE ID = #getcompany.id#		
		</CFQUERY>
<cfinclude template="abstractor_auto_email.cfm">

</cfif>		
		<!---
<CFQUERY datasource="#request.dsn#">		
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('#read_user.FName#', '#read_user.LName#', #rec_id#, 'Abstract Assigned to Vendor', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')		
		</CFQUERY>	
</cfif>
			
<cfif read_abs.email neq "">
<CFQUERY datasource="#request.dsn#" NAME="get_comp">
			select * from companies
			WHERE ID = #getcompany.id#		
		</CFQUERY>
<cfinclude template="abstractor_auto_email.cfm">

--->
</cfif>

