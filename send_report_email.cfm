<cfif #a_trigger# eq 1>
<CFQUERY datasource="#request.dsn#" NAME="read_report">

			SELECT a.title_id
			FROM Title a, doc_abstract_title f
			WHERE a.title_id = f.title_id and (a.title_id = f.title_id AND f.a_recieved_by is null)
</cfquery>



<CFQUERY datasource="#request.dsn#" NAME="read_abstractor">

			SELECT *
			FROM abstractors
			where company = 'test2' OR company = 'abstractor_test'
</cfquery>




				<CFMAIL query="read_abstractor"
				TO="#email#"
				FROM="webmaster@firsttitleservices.com" Subject="Vendor management report"
				TIMEOUT="600"
				>
		Orders with "Abstract Unrecieved" status
		<CFLOOP query="read_report">
		#title_id#
		</cfloop>

				</cfmail>


<CFQUERY datasource="#request.dsn#" NAME="read_title">

			SELECT *
			FROM Title a, eventlist f
			WHERE a.title_id = f.title_id  AND (DATEDIFF(day, getdate(), YearMonth) = 2)
</cfquery>

<cfloop query="read_title">
<CFQUERY datasource="#request.dsn#" NAME="read_note">
SELECT *
FROM title_notes
WHERE order_id = #title_id# AND status is null
</cfquery>

<cfif #read_note.recordcount# EQ 0>

			<CFMAIL
				TO="#Verifyemail#"
				FROM="webmaster@firsttitleservices.com" Subject="File No- T-#title_id# - #blastname1#, #bfirstname1#"
				TIMEOUT="600"
				>
 Closing is scheduled for #c_Month#/#c_day#/#c_year# at #c_time#.
 For you information, file is not marked as "Clear to Close" in First Title's system.
 Please contact your processor at First Title to discuss this file.
 Thank you for your cooperation.

 Property Address: #paddress#, #pcity#, #pstate# #pzip#

                 #pname#
                 First Title & Escrow, Inc.
                 30 West Dude Drive, Suite 450
                 Rockville, Maryland 20850
                 Phone - #pphone# X #pext#
                 Direct Fax -#pfax#



				</cfmail>
</cfif>
</cfloop>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>

</head>

<BODY BGCOLOR="e1e1e1" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER><br><br><br><br>
<table width=330 cellpadding=1 cellspacing=1 border=0 bgcolor=d3d3d3>
	<tr>
		<td width=330 align=center valign=top>

<table width=330 cellpadding=1 cellspacing=1 border=0 bgcolor=white>

		<td width=330 align=center valign=top bgcolor=e1e1e1>
<FONT FACE=ARIAL SIZE=2 color="BLUE">
				<CENTER><B> Emails with a list of 'Abstracts Unreceived' order numbers has been sent to abstractors.<br>
							Emails to customers has been sent to remind them if their file is not marked 'Clear to Close' 2 days before the Closing Schedule<br>
							</B></CENTER>

<br><br>
<a href="javascript:window.close();"><img src="./images/button_close.gif" border=0></a>
</td>
</tr>

	</table>


			</TD>
		</TR>

	</table>

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


	 </cfif>
	 <cfset #a_trigger# eq 0>