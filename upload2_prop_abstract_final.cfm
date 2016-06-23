
<cfparam name="form.search_date" default="">

<cfparam name="form.effective_date" default="">

<cfparam name="form.file_upload" default="">

<cfparam name="session.logged_in_vendor_id" default="0">

<cfparam name="form.changes" default="0">

<cfparam name="url.uid" default="0">

<cfif form.file_upload eq ''>
<script language="javascript">
alert("Please select a file to upload");
history.go(-1);
</script>
<cfabort>
<cfelseif form.effective_date eq '' or NOT IsDate(form.effective_date)>
<script language="javascript">
alert("Please fill out the Effective Date of this new update");
history.go(-1);
</script>
<cfabort>
<cfelseif form.search_date eq '' or NOT IsDate(form.search_date)>
<script language="javascript">
alert("Please fill out the Search Date of this new update");
history.go(-1);
</script>
<cfabort>
</cfif>


			<CFFILE
				DESTINATION="c:\uploads\"
				ACTION="UPLOAD"
				NAMECONFLICT="MAKEUNIQUE"
				FILEFIELD="file_upload">

<cfset fileSys = CreateObject('component','cfc.FileManagement')>
<cfset new_file_name = #fileSys.MoveFromUploads('#FILE.ServerFile#')#>



		 <!--- <CFQUERY datasource="#request.dsn#" NAME="insert_filename">
			update doc_abstract_prop set abstractor_doc_upload2 = '#FILE.ServerFile#'
			WHERE prop_id = #rec_ID#
			</cfquery>  --->
		 <CFQUERY datasource="#request.dsn#" NAME="insert_filename">
			INSERT INTO Abstractor_Uploads (order_id, upload_date, filename, vendor_id, filetype, search_date, effective_date, uid, changes)
			values (#rec_id#, #CreateODBCDate(Now())#, '#new_file_name#', #session.logged_in_vendor_id#, 'update', #CreateODBCDate(form.search_date)#, #CreateODBCDate(form.effective_date)#, #url.uid#, #form.changes#)
			</cfquery>

		<CFQUERY datasource="#request.dsn#" NAME="read_prop">
			select * from property
			WHERE prop_id = #rec_ID#
			</cfquery>

<CFSET order_date_adj = '#DateFormat(Now(), "mm/dd/yyyy")# #TimeFormat(Now(), "HH:mm:ss")#'>

<CFQUERY datasource="#request.dsn#" NAME="read_title_abs">
UPDATE Doc_Abstract_prop
set
a_Recieved_by = 264,
a_Date_Completed = '#DateFormat(Now(), "mm/dd/yyyy")#',
r_dateandtime = '#order_date_adj#',
a_Time_Completed = '#TimeFormat(Now(), "HH:mm:ss")#'
WHERE prop_ID = #rec_ID#
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="insert_filename">
update Doc_Title_Insurance_Prop set a_recieved = NULL
WHERE prop_id = #rec_ID#
</cfquery>


<CFQUERY datasource="#request.dsn#" NAME="update_prop">
			update property
			set appraisal_status = 'Abstract Received from Vendor'
			WHERE prop_id = #rec_ID#
</cfquery>

			<CFQUERY datasource="#request.dsn#" NAME="insert_filename">
			update Property set 
			cancelled = NULL
			WHERE prop_id = #rec_ID#
			</cfquery> 

			<CFQUERY datasource="#request.dsn#" NAME="update_Doc_Title_Insurance_prop">
			UPDATE Doc_Title_Insurance_prop
			set
			a_Recieved_date = NULL
			WHERE prop_ID = #rec_ID#
		    </CFQUERY>
			
			<!--- 		<CFMAIL
TO="rjermain@firsttitleservices.com"
FROM="webmaster@firsttitleservices.com"
SERVER="127.0.0.1"
Subject="There is a new update uploaded from abstractor for order #read_prop.prop_id#"
TIMEOUT="600"
	>

There is a file sent from abstractor for order #read_prop.prop_id#




</CFMAIL>			 --->
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