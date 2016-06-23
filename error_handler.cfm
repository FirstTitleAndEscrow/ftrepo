<CFMAIL
  from="weberror@firsttitleservices.com"
  to="#Error.MailTo#"
	server="127.0.0.1"
  subject="Auto Error Report"
	TIMEOUT="600"
	type="HTML">
1.Error occured in template<font color="blue">:#Error.Template#</font><br>

2.At this time:<font color="blue">#Error.DateTime#</font><br>

3.The query string was:<font color="green">#Error.QueryString#</font><br>

4.A detailed diagnostic follows:<br>

<font color="red">"#Error.Diagnostics#"</font><br>
</cfmail>

<html>
<head>
   <title>We're sorry -- An Error Occurred</title>
</head>
<body>
   <h2>We're sorry -- An Error Occurred. Webmaster is informed</h2>

   <p>
	 <cfoutput>
      <!--- If you continue to have this problem, please contact <a href="mailto:#error.mailTo#">Webmaster</a>
      with the following information (please copy and paste into email): --->
	  Please describe how you get this error and send message to <a href="mailto:#error.mailTo#">Webmaster</a></p>
   <p>
<ul>

   <li><b>Date and Time the Error Occurred:</b> #error.dateTime#
   <li><b>Page You Came From:</b><font color="blue"> #error.HTTPReferer#</font>
   <li><b>Message Content</b>:
    <p><font color="red">"#error.diagnostics#"</p></font>
</ul>
 </cfoutput>

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
