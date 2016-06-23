<!--- <cfif cgi.REMOTE_ADDR eq '98.233.55.8'>


<cfabort>
</cfif>
 --->
<CFPARAM NAME="comments_only" DEFAULT="0">
<CFPARAM NAME="proptype" DEFAULT="">
<CFPARAM NAME="taxid" DEFAULT="">
<CFPARAM NAME="parcel" DEFAULT="">
<CFPARAM NAME="exempt" DEFAULT="">
<CFPARAM NAME="amount" DEFAULT="">
<CFPARAM NAME="extype" DEFAULT="">
<CFPARAM NAME="land" DEFAULT="">
<CFPARAM NAME="impass" DEFAULT="">
<CFPARAM NAME="other" DEFAULT="">
<CFPARAM NAME="val" DEFAULT="">
<CFPARAM NAME="tx" DEFAULT="">
<CFPARAM NAME="tax_year" DEFAULT="">
<CFPARAM NAME="inst_monx" DEFAULT="">
<CFPARAM NAME="inst_dayx" DEFAULT="">
<CFPARAM NAME="inst_yearx" DEFAULT="">
<CFPARAM NAME="inst_mont" DEFAULT="">
<CFPARAM NAME="inst_dayt" DEFAULT="">
<CFPARAM NAME="inst_yeart" DEFAULT="">
<CFPARAM NAME="rec_mont" DEFAULT="">
<CFPARAM NAME="rec_dayt" DEFAULT="">
<CFPARAM NAME="rec_yeart" DEFAULT="">
<CFPARAM NAME="stat" DEFAULT="">
<CFPARAM NAME="pay_to" DEFAULT="">
<CFPARAM NAME="txamt" DEFAULT="">
<CFPARAM NAME="del_year" DEFAULT="">
<CFPARAM NAME="infotax" DEFAULT="">
<CFPARAM NAME="username" DEFAULT="">
<CFPARAM NAME="password" DEFAULT="">
<CFPARAM NAME="a_trigger" DEFAULT="0">
<CFPARAM NAME="Abstractor_ID_new" DEFAULT="">
<CFPARAM NAME="submitted" DEFAULT="">
<CFPARAM NAME="assigned" DEFAULT="">
<CFPARAM NAME="taxes_completed" DEFAULT="0">

<cfif #rec_yeart# NEQ "" AND #rec_mont# NEQ "" AND #rec_dayt# NEQ "">
<CFSET recdatet = #CreateDate(#rec_yeart#, #rec_mont#, #rec_dayt#)#>
<cfelse>
<cfset recdatet = "">
</cfif>

<CFSET c_date = #DateFormat(Now(), "mm/dd/yyyy")#>
<CFSET c_time = #TimeFormat(Now(), "HH:mm:ss")#>



<CFSET order_date_adj = '#DateFormat(Now(), "mm/dd/yyyy")# #TimeFormat(Now(), "HH:mm:ss")#'>

<!---Create note that Taxes were completed--->
<cfif taxes_completed eq 1>
<CFQUERY datasource="#request.dsn#" NAME="update_tracker">
			update Vendor_Tracker_new
			set return_date = '#DateFormat(Now(), "m/d/yyyy")#',
			return_time = '#TimeFormat(Now(), "HH:mm:ss")#',
			completed = 1
			WHERE order_id = #url.rec_ID#
			and vendor_id = #session.vendor_id#
			and task = 'TaxPrep'
			and completed is NULL
			</cfquery>
</cfif>

<cfabort>

<cfif comments_only eq 1>
<CFQUERY datasource="#request.dsn#" >
			UPDATE tax_cert_title
			set a_date_started = 'Yes',
			 <cfif taxes_completed eq 1>
			 taxes_completed = 1,
			 </cfif>
			comments='#comments#',
			comments_only = '#comments_only#'
			where title_id = #rec_id#
 </cfquery>

 <cfelse>

<CFQUERY datasource="#request.dsn#" >
			UPDATE tax_cert_title
			SET 	a_date_started = 'Yes',
			<cfif taxes_completed eq 1>
			 taxes_completed = 1,
			 </cfif>
			 a_date_finished = '#c_date#',
			t_dateandtime = '#order_date_adj#',
			a_time_finished = '#c_time#',
      <cfif #submitted# eq 1>
			submitted = 1,
			</cfif>
			payto='#payto#',
			taxcoll='#taxcoll#',
			add1='#add1#',
			add2='#add2#',
			city='#city#',
			state='#state#',
			zip='#zip#',
			phone='#phone#',
			web='#web#',
			acctnum='#acctnum#',
			taxfreq='#taxfreq#',
			<cfif #paidfrom# neq "" and #paidfrom# neq "na" and #paidfrom# neq "n/a">
			paidfrom='#DateFormat(paidfrom, "mm/dd/yyyy")#',
			<cfelse>
			paidfrom=NULL,
			</cfif>
			<cfif #paidto# neq "" and #paidto# neq "na" and #paidto# neq "n/a">
			paidto='#DateFormat(paidto, "mm/dd/yyyy")#',
			<cfelse>
			paidto=NULL,
			</cfif>
			lastamt='#lastamt#',
			<cfif #duefrom# neq "" and #duefrom# neq "na" and #duefrom# neq "n/a">
			duefrom='#DateFormat(duefrom, "mm/dd/yyyy")#',
			<cfelse>
			duefrom=NULL,
			</cfif>
			<cfif #dueto# neq "" and #dueto# neq "na" and #dueto# neq "n/a">
			dueto='#DateFormat(dueto, "mm/dd/yyyy")#',
			<cfelse>
			dueto=NULL,
			</cfif>
			dueamt='#dueamt#',
			<cfif #paiddate# neq "" and #paiddate# neq "na" and #paiddate# neq "n/a">
			paiddate='#DateFormat(paiddate, "mm/dd/yyyy")#',
			<Cfelse>
			paiddate=NULL,
			</cfif>
			<cfif #duedate# neq "" and #duedate# neq "na" and #duedate# neq "n/a">
			duedate='#DateFormat(duedate, "mm/dd/yyyy")#',
			<cfelse>
			duedate=NULL,
			</cfif>
      <cfif #thrudate# neq "" and #thrudate# neq "na" and #thrudate# neq "n/a">
			thrudate='#DateFormat(thrudate, "mm/dd/yyyy")#',
			<cfelse>
			thrudate=NULL,
			</cfif>
			delamt='#delamt#',
			comments='#comments#',
			comments_only = '#comments_only#'
			where title_id = #rec_id#
 </cfquery>
</cfif>



  <CFQUERY datasource="#request.dsn#" NAME="ft_user">
 	SELECT     company, lname
	FROM       Vendors_STACIE
	WHERE      username = '#username#' and password = '#password#'
 </CFQUERY>
 <cfif taxes_completed eq 1>
  <CFQUERY datasource="#request.dsn#">
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('#ft_user.company#', '#ft_user.LName#', #URL.rec_id#, 'Taxes Completed by #ft_user.company# and ready for Review', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')
	</CFQUERY>

<!--- <CFMAIL
				TO="vendormgr@firsttitleservices.com"
				FROM="vendormgr@firsttitleservices.com" Subject="Taxes Completed by #ft_user.company# and ready for Review - Order #rec_id#"
				TIMEOUT="600"
>

 Taxes Completed by vendor #ft_user.company# and ready for Review - Order #rec_id#

</cfmail>
 --->
 </cfif>




<CFLOCATION URL="https://#cgi.server_name#/vendor_landing.cfm?vendor_id=#session.vendor_id#">
