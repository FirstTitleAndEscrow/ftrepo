
<cfif form.action EQ "add">
	
	<CFQUERY datasource="#request.dsn#" NAME="ins">
		insert into apr_payments(apr_file_id,datepaid,amtpaid,checknum)
		values(#apr_file_id#,'#datepaid#','#amtpaid#','#checkNum#')
	</CFQUERY>
	<cfset id = apr_file_id>
<cfelse>
	<CFQUERY datasource="#request.dsn#" NAME="update">
		update apr_files
		set
		amtdue = <cfif Len(amtDue)>#amtDue#<cfelse>null</cfif>,
		amtpaid = <cfif Len(amtPaid)>#amtPaid#<cfelse>null</cfif>,
		paiddate = '#paiddate#',
		checknum = '#checknum#'
		where id = #id#
	</CFQUERY>
</cfif>


<CFQUERY datasource="#request.dsn#" NAME="read_file">
	select * from apr_files
	where id = #id#
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_payments">
	select apr_payment_id,amtpaid,datepaid,checkNum from apr_payments
	where apr_file_id = #id#
	
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_total">
	select coalesce(sum(amtpaid),0) as totalpaid from apr_payments
	where apr_file_id = #id#
	
</CFQUERY>

<cfif read_file.price NEQ 0 AND read_file.price LTE read_total.totalpaid>
	<CFQUERY datasource="#request.dsn#" NAME="update">
		update apr_files
		set paid_in_full = 1
		where id = #id#
	</cfquery>
</cfif>


<cfif isDefined("returnUrl")>
	<cflocation url="apr_file_modify.cfm?id=#apr_file_id#&returnUrl=#UrlEncodedFormat(returnUrl)#" addtoken="no">
<cfelse>
	<cflocation url="apr_file_modify.cfm?id=#apr_file_id#" addtoken="no">
</cfif>