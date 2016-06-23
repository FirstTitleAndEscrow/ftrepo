

			<CFFILE
				DESTINATION="c:\uploads\"
				ACTION="UPLOAD"
				NAMECONFLICT="MAKEUNIQUE"
				FILEFIELD="file_upload">

<cfset fileSys = CreateObject('component','cfc.FileManagement')>
<cfset new_file_name = #fileSys.MoveFromUploads('#FILE.ServerFile#')#>


<CFSET order_date_adj = '#DateFormat(Now(), "mm/dd/yyyy")# #TimeFormat(Now(), "HH:mm:ss")#'>
			<CFQUERY datasource="#request.dsn#" NAME="insert_filename">
			update doc_abstract_title set abstractor_doc_upload = '#new_file_name#',
			a_Date_Completed = '#DateFormat(Now(), "mm/dd/yyyy")#',
			a_Recieved_by = 264,
			r_dateandtime = '#order_date_adj#',
			a_Time_Completed = '#TimeFormat(Now(), "HH:mm:ss")#'
			WHERE title_id = #rec_ID#
			</cfquery>

		    <CFQUERY datasource="#request.dsn#" NAME="read_title">
			select * from title
			WHERE title_id = #rec_ID#
			</cfquery>

<CFQUERY datasource="#request.dsn#" name="write_note">
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('Web', 'System', #rec_id#, 'Abstract Received from Vendor - Title In Typing', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')
		</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="update_title">
			update title
			set appraisal_status = 'Abstract Received from Vendor'
			WHERE title_id = #rec_ID#
</cfquery>

<!--- do a check for any auto-routing at this point "Abstract_Uploaded" --->
<cfset temp = #routingSys.CheckForRouting(rec_ID, 'T', 'Abstract_Uploaded')#>



<cfif IsDefined("session.new_vendor_system") and session.new_vendor_system eq 1>
		    <CFQUERY datasource="#request.dsn#" NAME="update_tracker">
			update Vendor_Tracker_new
			set return_date = '#DateFormat(Now(), "m/d/yyyy")#',
			return_time = '#TimeFormat(Now(), "HH:mm:ss")#',
			completed = 1
			WHERE order_id = #url.rec_ID#
			and vendor_id = #session.vendor_id#
			and task = 'Abstract'
			and completed is NULL
			</cfquery>
<cflocation url="vendor_abstract_upload.cfm?a_trigger=1&company_id=#session.vendor_id#&rec_id=#url.rec_ID#" addtoken="no">
</cfif>

<!--- <CFMAIL
TO="binders@firsttitleservices.com"
FROM="webmaster@firsttitleservices.com"
SERVER="127.0.0.1"
Subject="Abstract uploaded by vendor for order #read_title.title_id#"
TIMEOUT="600"
	>

Abstract uploaded for order #read_title.title_id#


</CFMAIL>  --->


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<CFSET datnow = "#DateFormat(Now())#">
<CFSET timnow = "#TimeFormat(Now())#">




<html>
<head>
	<title>1st Title & Escrow, Inc. - Welcome</title>
</head>

<BODY BGCOLOR="e1e1e1" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER><br><br><br><br><br><br><br><br><br>
<table width=490 cellpadding=1 cellspacing=1 border=0 bgcolor=d3d3d3>
	<tr>
		<tr>
		<td width=455 colspan=2 align=center valign=top>
			<img src="images/clear.gif" width=455 height=10 alt="" border="0">
		</td>
		</tr>
		<tr>
		<td width=455 colspan=2 align=center valign=top>
			<font size=3 align=center color=blue face=arial>
		<B>1st Title & Escrow, Inc. - File Upload Complete</B>
		<p>
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
			SELECT c.ID, t.title_id, teams.ID, teams.email, c.streamline_client
			FROM Companies c, Title t, Teams teams
			WHERE t.title_ID = #rec_ID#
			and c.ID = t.comp_id
			and teams.ID = c.team_id
		</CFQUERY>
<!--- taken out due to complaints about too many emails, mainly from Heidi 3/16/10 --->
<cfif get_team_email.streamline_client EQ 1>
	<cfmail subject="File Uploaded by client for order #rec_ID#" to="titleorders@streamline-title.com" from="webmaster@firsttitleservices.com">
	A file has been uploaded by the client for order #Rec_ID#.
	
	the filename is: #FILE.ServerFile#
	
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