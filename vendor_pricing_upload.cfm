

<CFQUERY datasource="#request.dsn#" NAME="get_vendor">
select * from Vendors_STACIE where vendor_id = #url.vendor_id#
</CFQUERY>



<CFPARAM NAME="url.vendor_id" DEFAULT=0>
<cfif Len(form.pricing_upload)>
<CFFILE
DESTINATION="c:\uploads\"
ACTION="UPLOAD"
NAMECONFLICT="MAKEUNIQUE"
FILEFIELD="pricing_upload">
<cfset fileSys = CreateObject('component','cfc.FileManagement')>
<cfset new_file_name = #fileSys.MoveFromUploads('#FILE.ServerFile#', 'upload_many', 'fileupload', 'title_id', '#get.title_id#')#>

<CFQUERY datasource="#request.dsn#" NAME="update_vendor">
update Vendors_STACIE
set last_pricing_update_file = '#new_file_name#',
last_pricing_update_date = '#DateFormat(Now(), "m/d/yyyy")#'
where vendor_id = #url.vendor_id#
</CFQUERY>



<cfmail to="rjermain@firsttitleservices.com; mather@firsttitleservices.com" from="webmaster@firsttitleservices.com" subject="New Vendor Pricing Uploaded - #get_vendor.company#" type="html" server="127.0.0.1">
<cfmailparam file="c:\uploads\#new_file_name#">

The attached Excel File is a new pricing structure for #get_vendor.company#<br>
<br>
To approve this pricing, click <a href="https://www.firsttitleservices.com/admin_area/vendor_pricing_approve.cfm?vendor_id=#url.vendor_id#&filename=#new_file_name#">here</a>.

</cfmail>

<cflocation url="vendor_landing.cfm?vendor_id=#url.vendor_id#&uploaded=1" addtoken="no">
</cfif>