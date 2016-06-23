<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
</head>

<body>

<cfoutput>
<cfset date="#DateFormat(now())#">
</cfoutput>
<cfsetting enablecfoutputonly="Yes" showdebugoutput="No">
<cfcontent type="application/vnd.fdf">

<CFOUTPUT>%FDF-1.2
  1 0 obj <<
  /FDF <<
  /Fields
  [
   <<
    /T(date)
    /V(#date#)
   >>
   <<
    /T(lname)
    /V(#form.lname#)
   >>
   <<
    /T(mname)
    /V(#form.mname#)
   >>
   <<
    /T(fname)
    /V(#form.fname#)
   >>

  ]
  /F(https://#cgi.server_name#/pdf/#Request.myPDF#>Your PDF File</A>.pdf)
  >>
  >>
  endobj
  trailer
  <</Root 1 0 R>>
  %%EOF
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
