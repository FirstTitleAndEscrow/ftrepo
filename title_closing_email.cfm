
<CFQUERY datasource="#request.dsn#" NAME="read_title_closer">

			SELECT *
			FROM Doc_closer_Title
			WHERE title_ID = #rec_ID#

		</CFQUERY>


<CFQUERY datasource="#request.dsn#" NAME="read_assigned_closer">

			SELECT *
			FROM closer
			WHERE  closer_ID = #read_title_closer.closer_ID#

</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_title">

			SELECT *
			FROM Title
			WHERE title_ID = #rec_ID#

		</CFQUERY>
<!--- <cfif #read_assigned_closer.pref_for_send# EQ "Fax">
<CFMAIL
TO="1#fax#@efaxsend.com,titleorders@yahoo.com, gwelt@firsttitleservices.com"
FROM="pgibb@firsttitleservices.com" Subject="Closer Info"
TIMEOUT="600"
>
Closing Form for order number: #rec_id#

Person that Assigned the Closer - #user_that_started#
Date Started - #date#
Time Started - #time#
Person that recieved the Closing - #user_that_finished#
Date Completed - #datecomplete#
Time Completed - #timecomplete#
<CFIF #read_assigned_closer.recordcount# EQ "0">
Closer Assigned - Not yet Assigned<CFELSE>
Closer Assigned - #assign#</CFIF>
Phone -  #phone#
Ext -  #ext#
Email - #email#
Fax -  #fax#
Sent by - #sent#
PRESENT OWNER - #owner#
PURCHASER - #purchaser#
Property Address:
#addr#
#city#
#state#
#zip#
#county#

Instructions
SEARCH BACK TO A WARRANTY DEED
COPIES OF DEED/MORTGAGES/DEED OF TRUST/JUDGMENTS
TAX INFORMATION
PLEASE FAX REPORT TO 240-209-0787 OR EMAIL TO pgibb@firsttitleservices.com

</CFMAIL>

<cfelse> titleorders@yahoo.com, , --->
<CFMAIL
TO="#email#"
FROM="pgibb@firsttitleservices.com" Subject="Closer Info"
TIMEOUT="600"
>
Closing Form for order number: #rec_id#

Person that Assigned the Closer - #user_that_started#
Date Started - #date#
Time Started - #time#
Person that recieved the Closing - #user_that_finished#
Date Completed - #datecomplete#
Time Completed - #timecomplete#
<CFIF #read_assigned_closer.recordcount# EQ "0">
Closer Assigned - Not yet Assigned<CFELSE>
Closer Assigned - #assign#</CFIF>
Phone -  #phone#
Ext -  #ext#
Email - #email#
Fax -  #fax#
Sent by - #sent#
PRESENT OWNER - #owner#
PURCHASER - #purchaser#
Property Address:
#addr#
#city#
#state#
#zip#
#county#

Instructions
SEARCH BACK TO A WARRANTY DEED
COPIES OF DEED/MORTGAGES/DEED OF TRUST/JUDGMENTS
TAX INFORMATION
PLEASE FAX REPORT TO 240-209-0787 OR EMAIL TO pgibb@firsttitleservices.com

</CFMAIL>
<!--- </cfif> --->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
</head>

<body>
email has been sent to the person that processed the order


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
