	<cfif #date# eq "">
<CFLOCATION URL="https://#cgi.server_name#/admin_area/title_abstract_doc_view.cfm?uid=#uid#&al=#al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#&a_flag=1">

	<cfelse>
<CFQUERY datasource="#request.dsn#" NAME="read_title_abstract">

			SELECT *
			FROM Doc_Abstract_Title
			WHERE title_ID = #rec_ID#

		</CFQUERY>


<CFQUERY datasource="#request.dsn#" NAME="read_assigned_abstractor">

			SELECT *
			FROM Abstractors
			WHERE  abstractor_ID = #read_title_abstract.abstractor_ID#

</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_title">

			SELECT *
			FROM Title
			WHERE title_ID = #rec_ID#

		</CFQUERY>




<cfif #read_assigned_abstractor.pref_for_send# EQ "Email">

<CFMAIL
TO="#read_assigned_abstractor.email#"
FROM="neworders@firsttitleservices.com" Subject="Abstractor Info for order #read_title.title_id#"
TIMEOUT="600"
>

ABSTRACT USA, LLC



PROPERTY INFORMATION ORDER FORM

Abstract Form for order number: #rec_id#

Person that Assigned the Abstractor - #user_that_started#
Date Ordered - #DateFormat(Now(), "m/d/yyyy")#    Time Ordered - #TimeFormat(Now(), "HH:mm:ss")#

<CFIF #read_assigned_abstractor.recordcount# EQ "0">
Abstractor Assigned - Not yet Assigned<CFELSE>
Abstractor Assigned - #assign#</CFIF>
Phone -  #phone#
Ext -  #ext#
Email - #email#
Fax -  #fax#
Sent by - #sent#


SEARCH CRITERIA

PRESENT OWNER - #owner#
PURCHASER - #purchaser#
Property Address:
#addr#
#city#
#state#
#zip#
#county#


SEARCH BACK TO A WARRANTY DEED (instructions)
COPIES OF DEED/MORTGAGES/DEED OF TRUST/JUDGMENTS
TAX INFORMATION
PLEASE FAX REPORT TO 240-209-0787 OR EMAIL TO sdari@firsttitleservices.com

</CFMAIL>
<cfelse>
<CFMAIL
TO="1#read_assigned_abstractor.fax#@efaxsend.com"
FROM="neworders@firsttitleservices.com" Subject="Abstractor Info for order #read_title.title_id#"
TIMEOUT="600"
>
ABSTRACT USA, LLC



PROPERTY INFORMATION ORDER FORM

Abstract Form for order number: #rec_id#

Person that Assigned the Abstractor - #user_that_started#
Date Ordered - #DateFormat(Now(), "m/d/yyyy")#    Time Ordered - #TimeFormat(Now(), "HH:mm:ss")#

<CFIF #read_assigned_abstractor.recordcount# EQ "0">
Abstractor Assigned - Not yet Assigned<CFELSE>
Abstractor Assigned - #assign#</CFIF>
Phone -  #phone#
Ext -  #ext#
Email - #email#
Fax -  #fax#
Sent by - #sent#


SEARCH CRITERIA

PRESENT OWNER - #owner#
PURCHASER - #purchaser#
Property Address:
#addr#
#city#
#state#
#zip#
#county#


SEARCH BACK TO A WARRANTY DEED (instructions)
COPIES OF DEED/MORTGAGES/DEED OF TRUST/JUDGMENTS
TAX INFORMATION
PLEASE FAX REPORT TO 240-209-0787 OR EMAIL TO sdari@firsttitleservices.com

</CFMAIL>
</cfif>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
</head>

<body>

<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=790 align=center valign=top>

<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
			<td width=790 align=left valign=top bgcolor=green>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Email Sent</B></CENTER>
			</TD>
		</TR>

	<tr>
		<td width=790 align=center valign=top bgcolor=e1e1e1>
	<CFINCLUDE TEMPLATE="./includes/title_top_nav.cfm">

<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 colspan=2 align=center valign=top bgcolor=f3f3f3>
				<font size=3 color=blue face=arial>
				<B>Email has been sent to the abstractor assigned</B>
			</td>
		</tr>
</table
></td>
</tr>
</table>
</td>
</tr>
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
</html>
</cfif>