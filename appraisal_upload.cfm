 <cfparam name="url.delete" default="0">
 <CFSET datnow = "#DateFormat(Now())#">
<CFSET timnow = "#TimeFormat(Now())#">

 <cfif url.delete eq 1>
<CFQUERY datasource="#request.dsn#" NAME="read_app">
			select * from Appraisal
			WHERE app_id = #rec_ID#
		</cfquery>

<CFQUERY datasource="#request.dsn#" NAME="update_app">
			update Appraisal
			set appraisal_doc_upload = NULL
			WHERE app_id = #rec_ID#
		</cfquery>

<CFQUERY datasource="#request.dsn#" NAME="find_app" maxrows=1>
select * from Vendor_Tracker_New
where completed = '1'
and Order_id = #rec_ID#
and task = 'Appraisal'
and vendor_id = #session.logged_in_vendor_id#
order by assign_date, assign_time desc
</cfquery>

<CFQUERY datasource="#request.dsn#" NAME="update_app">
update Vendor_Tracker_New
set return_date = '',
return_time = '',
completed = NULL
where Order_id = #find_app.order_id#
and task = 'Appraisal'
and ID = #find_app.id#</cfquery>

<CFFILE ACTION="delete" file="c:\uploads\#read_app.appraisal_doc_upload#">

<cfelse>

			<CFFILE
				DESTINATION="c:\uploads\"
				ACTION="UPLOAD"
				NAMECONFLICT="MAKEUNIQUE"
				FILEFIELD="file_upload">
<cfset fileSys = CreateObject('component','cfc.FileManagement')>
<cfset new_file_name = #fileSys.MoveFromUploads('#FILE.ServerFile#')#>

			 <CFQUERY datasource="#request.dsn#" NAME="insert_filename">
			update appraisal set appraisal_doc_upload = '#new_file_name#'
			WHERE app_id = #rec_ID#
			</cfquery>


			 <CFQUERY datasource="#request.dsn#" NAME="read_title">
			select * from Appraisal
			WHERE app_id = #rec_ID#
			</cfquery>

<CFQUERY datasource="#request.dsn#" NAME="find_app" maxrows=1>
select * from Vendor_Tracker_New
where (completed = '0' or completed IS NULL)
and Order_id = #rec_ID#
and task = 'Appraisal'
and vendor_id = #session.logged_in_vendor_id#
order by assign_date, assign_time desc
</cfquery>

<CFQUERY datasource="#request.dsn#" NAME="update_app">
update Vendor_Tracker_New
set return_date = '#datnow#',
return_time = '#timnow#',
completed = '1'
where Order_id = #find_app.order_id#
and task = 'Appraisal'
and ID = #find_app.id#</cfquery>

</cfif>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">




<html>
<head>
	<title>1st Title & Escrow, Inc. - Welcome</title>
</head>
<BODY BGCOLOR="e1e1e1" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER><br><br><br><br><br><br><br><br><br>
<table width=490 cellpadding=1 cellspacing=1 border=0 bgcolor=d3d3d3>

		<tr>
		<td width=455 colspan=2 align=center valign=top>
			<img src="images/clear.gif" width=455 height=10 alt="" border="0">
		</td>
		</tr>
		<tr>
		<td width=455 colspan=2 align=center valign=top>
			<font size=3 align=center color=blue face=arial>
		<cfif url.delete eq 1>
		<B>1st Title & Escrow, Inc. - File Deleted</B>
		<cfelse>
		<B>1st Title & Escrow, Inc. - File Upload Complete</B>
		</cfif>
		<p><br>
<br>
<a href="vendor_landing.cfm">Return</a>
		</td>
		</tr>


		</tr>
		</table>



    </td>
  </tr>
</table>
  </td>
  </tr>
</table>
</center>
<CFQUERY datasource="#request.dsn#" NAME="get_team_email">
			SELECT c.ID, t.app_id, teams.ID, teams.email
			FROM Companies c, Appraisal t, Teams teams
			WHERE t.app_ID = #rec_ID#
			and c.ID = t.comp_id
			and teams.ID = c.team_id
		</CFQUERY>
<!--- #get_team_email.email# --->

<cfif url.delete eq 1>
<cfmail subject="Appraisal upload DELETED by vendor for order APP-210#rec_ID#" to="#get_team_email.email#" from="webmaster@firsttitleservices.com" bcc="rjermain@firsttitleservices.com">
Appraisal upload has been DELETED by the vendor for order APP-210#Rec_ID#.
</cfmail>
<cfelse>
<cfmail subject="Appraisal uploaded by vendor for order APP-210#rec_ID#" to="#get_team_email.email#" from="webmaster@firsttitleservices.com" bcc="rjermain@firsttitleservices.com">
Appraisal has been uploaded by the vendor for order APP-210#Rec_ID#.

the filename is: #new_file_name#

Uploaded #DateFormat(now(), "mm-dd-yyyy")# - #TimeFormat(now(), "long")#
</cfmail>
</cfif>
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