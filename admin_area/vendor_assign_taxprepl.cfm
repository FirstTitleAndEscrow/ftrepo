<CFPARAM NAME="form.order_type" DEFAULT="T">
<cfif form.appraisal_commit eq 1>
<CFQUERY datasource="#request.dsn#" NAME="insert_item">
Insert into Vendor_Tracker_New (Order_id,Vendor_ID,assign_date,assign_time,assigned_by,task,order_type,assigned_price)
values
('#form.Order_id#','#form.Vendor_ID#','#DateFormat(Now(), "mm/dd/yyyy")#','#TimeFormat(Now(), "HH:mm:ss")#','#session.ft_user_id#','Appraisal','#form.order_type#',#form.appraisal_price#)
</cfquery>
</cfif>

<cfif form.appraisal_commit eq 1>
<cflocation url="vendor_manager.cfm?selected_appraisal_vendor_id=0" addtoken="no">
<cfelse>
<cflocation url="vendor_manager.cfm?selected_appraisal_vendor_id=#form.vendor_id#" addtoken="no">
</cfif>
<cfabort>


