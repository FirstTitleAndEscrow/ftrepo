

<cfif form.action EQ "add">
	<cfif file_type EQ 'T'>
		<CFQUERY datasource="#request.dsn#" NAME="checkclient">
			select c.use_apr
			from companies c
			inner join title t on t.comp_id = c.id
			where t.title_id = '#file_id#'
		</cfquery>
	<cfelse>
		<CFQUERY datasource="#request.dsn#" NAME="checkclient">
			select c.use_apr
			from companies c
			inner join property p on p.comp_id = c.id
			where p.prop_id = '#file_id#'
		</cfquery>
	</cfif>
	<cfif checkclient.use_apr NEQ 1 AND paid_by EQ "client">
		<script>alert('The client for the selected file has not been set to use the APR system.'); history.go(-1);</script>
		<cfabort>
	</cfif>
	<CFQUERY datasource="#request.dsn#" NAME="ins">
		insert into apr_files(file_id,file_type,paid_by,product,aprdate,price,productreceiveddate)
		values('#file_id#','#file_type#','#paid_by#','#product#','#aprdate#',<cfif Len(price)>#price#<cfelse>null</cfif>,'#productreceiveddate#')
	</CFQUERY>
<cfelse>
	<CFQUERY datasource="#request.dsn#" NAME="update">
		update apr_files
		set
		aprdate = '#aprDate#',
		productreceiveddate = '#productreceivedDate#',
		product = '#product#',
		price = <cfif Len(price)>'#price#'<cfelse>null</cfif>,
		paid_by = '#paid_by#',
		vendorname = <cfif Len(vendorname)>'#vendorname#'<cfelse>null</cfif>,
		paid_in_full = '#paid_in_full#'
		where id = #id#
	</CFQUERY>
</cfif>
<cfif isDefined("returnUrl")>
	<cflocation url="#returnUrl#" addtoken="no">
<cfelse>
	<cflocation url="apr_files.cfm" addtoken="no">
</cfif>