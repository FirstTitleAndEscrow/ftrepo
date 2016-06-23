<cfparam name="max_orders_per_day" default=10>
<cfset todays_date = CreateODBCDateTime(Now())>
<cfset rec_id = read_title.prop_id>

<!--- 184 is First Title In House --->

<CFQUERY datasource="#request.dsn#" name="get_abs" maxrows="1">		
	Select * from Zip_info
	where county = '#pcounty#' and state = '#pstate#'
</CFQUERY>

<cfif (get_abs.pref_ab1_count LT max_orders_per_day OR get_abs.pref_abstractor1 eq 184) and get_abs.pref_abstractor1 neq 0>
<cfset assign_abstractor_id = get_abs.pref_abstractor1>
 <!--- assign abstractor1 here --->

<cfset ab1_count = get_abs.pref_ab1_count + 1>
<CFQUERY datasource="#request.dsn#" name="update_abs">		
	Update Zip_info
	set pref_ab1_count = #ab1_count#
	where county = '#pcounty#' and state = '#pstate#'
</CFQUERY>
<cfelse>
   <cfif (get_abs.pref_ab2_count LT max_orders_per_day OR get_abs.PREF_ABSTRACTOR2 eq 184) and get_abs.PREF_ABSTRACTOR2 neq 0>
   <cfset assign_abstractor_id = get_abs.PREF_ABSTRACTOR2>
   <!--- assign abstractor2 here --->
   <cfset ab2_count = get_abs.pref_ab2_count + 1>
   <CFQUERY datasource="#request.dsn#" name="update_abs">		
	Update Zip_info
	set pref_ab2_count = #ab2_count#
	where county = '#pcounty#' and state = '#pstate#'
    </CFQUERY>
   <cfelse>
       <cfif (get_abs.pref_ab3_count LT max_orders_per_day OR get_abs.PREF_ABSTRACTOR3 eq 184) and get_abs.PREF_ABSTRACTOR3 neq 0>
       <cfset assign_abstractor_id = get_abs.PREF_ABSTRACTOR3>
	   <!--- assign abstractor3 here --->
	   <cfset ab3_count = get_abs.pref_ab3_count + 1>
	   <CFQUERY datasource="#request.dsn#" name="update_abs">		
	   Update Zip_info
	   set pref_ab3_count = #ab3_count#
	   where county = '#pcounty#' and state = '#pstate#'
       </CFQUERY>
       <cfelse>
	   
	 <cfif get_abs.PREF_ABSTRACTOR1 neq 0>
        <cfset assign_abstractor_id = get_abs.PREF_ABSTRACTOR1>
		<!--- assign abstractor1 here --->
		<cfset ab1_count = get_abs.pref_ab1_count + 1>
		<CFQUERY datasource="#request.dsn#" name="update_abs">		
		Update Zip_info
		set pref_ab1_count = #ab1_count#
		where county = '#pcounty#' and state = '#pstate#'
		</CFQUERY>
	<cfelseif get_abs.PREF_ABSTRACTOR2 neq 0>
	<cfset assign_abstractor_id = get_abs.PREF_ABSTRACTOR2>
		<!--- assign abstractor1 here --->
		<cfset ab2_count = get_abs.pref_ab2_count + 1>
		<CFQUERY datasource="#request.dsn#" name="update_abs">		
		Update Zip_info
		set pref_ab2_count = #ab2_count#
		where county = '#pcounty#' and state = '#pstate#'
		</CFQUERY>
	<cfelseif get_abs.PREF_ABSTRACTOR3 neq 0>
	<cfset assign_abstractor_id = get_abs.PREF_ABSTRACTOR3>
		<!--- assign abstractor1 here --->
		<cfset ab3_count = get_abs.pref_ab3_count + 1>
		<CFQUERY datasource="#request.dsn#" name="update_abs">		
		Update Zip_info
		set pref_ab3_count = #ab3_count#
		where county = '#pcounty#' and state = '#pstate#'
		</CFQUERY>
	</cfif>
		
       </cfif>
   </cfif>
</cfif>

<cfif assign_abstractor_id eq 184>
<CFQUERY datasource="#request.dsn#" name="update_abs">		
	Insert into Abstractors_Assigned (Order_ID, Order_Type, Assigned_Date, Abstractor_ID)
	values
	(#rec_id#, 'P', #todays_date#, #assign_abstractor_id#)
</CFQUERY>
</cfif>







<CFQUERY datasource="#request.dsn#" NAME="read_abs">		
			select * from abstractors
			WHERE abstractor_ID = #assign_abstractor_id#		
		</CFQUERY>
		


<CFQUERY datasource="#request.dsn#" NAME="record_check">	
			Select * FROM Doc_Abstract_Prop
			WHERE prop_ID = #rec_ID#		
</CFQUERY>

<cfif record_check.recordcount eq 0>
<CFQUERY datasource="#request.dsn#" NAME="insert_new_record">	
			Insert into Doc_Abstract_Prop
			(prop_id)
			values
			(#rec_id#)
</CFQUERY>
</cfif>

<CFSET order_date_adj = '#DateFormat(Now(), "mm/dd/yyyy")# #TimeFormat(Now(), "HH:mm:ss")#'>

<cfif assign_abstractor_id eq 184>
<CFQUERY datasource="#request.dsn#" NAME="read_user">	
			select * from first_admin
			WHERE ID = 64 <!--- 64 is Amit Kumar's user ID --->		
</CFQUERY>
<cfset assigned_by_user = 64>
<cfelse>
<CFQUERY datasource="#request.dsn#" NAME="read_user">	
			select * from first_admin
			WHERE ID = 77 <!--- 77 is Shelly Brown's user ID --->		
</CFQUERY>
<cfset assigned_by_user = 77>
</cfif>

<cfif assign_abstractor_id eq 184>
<CFQUERY datasource="#request.dsn#" NAME="read_title_abs">	
			UPDATE Doc_Abstract_Prop
			SET Abstractor_ID = #assign_abstractor_id#,
			a_Assigned_by = #assigned_by_user#,
			company = '#read_abs.company#',
			a_Date_Assigned = '#DateFormat(Now(), "mm/dd/yyyy")#',
			a_currentdate = '#order_date_adj#',
			a_Time_Assigned = '#TimeFormat(Now(), "HH:mm:ss")#',
			abs_type = 1
			WHERE prop_ID = #rec_ID#
		</CFQUERY>
</cfif>		
<cfif assign_abstractor_id eq 184>
<CFQUERY datasource="#request.dsn#">		
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('#read_user.FName#', '#read_user.LName#', #rec_id#, 'Abstract will be done in-house', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'P', '1', '1')		
</CFQUERY>	

<cfquery  datasource="#request.dsn#">
  INSERT INTO TblUser_Roles (prop_id,vendor_mgmt_InHouse_ID,vendor_mgmt_InHouse_Start_Datetime,payoff_ID,payoff_Start_Datetime) Values(#rec_id#, 64, getdate(),64, getdate())
  </CFQUERY>
  
 <cfset to_email = "akumar@firsttitleservices.com">
 <cfinclude template="abstractor_auto_email_prop.cfm">
<cfelse>
		<!---
<CFQUERY datasource="#request.dsn#">		
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('#read_user.FName#', '#read_user.LName#', #rec_id#, 'Abstract Assigned to Vendor', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'P', '1', '1')		
		</CFQUERY>	
<cfquery  datasource="#request.dsn#">
  INSERT INTO TblUser_Roles (prop_id,abstract_id,abstract_start_datetime,payoff_ID,payoff_Start_Datetime) Values(#rec_id#, 77, getdate(),77, getdate())
  </CFQUERY>
</cfif>
			
<cfif read_abs.email neq "">
<CFQUERY datasource="#request.dsn#" NAME="get_comp">
			select * from companies
			WHERE ID = #getcompany.id#		
		</CFQUERY>

<cfif getcompany.id eq 100>
<cfset to_email = "rjermain@hotmail.com">
<cfelse>
<cfset to_email = read_abs.email>
</cfif>

<cfinclude template="abstractor_auto_email_prop.cfm">
--->
</cfif>
