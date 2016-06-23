<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
</head>

<body>
<h3>Round Example</h3>
<p>This function rounds a number to the closest integer.
<cfset x=12345.22>
<cfset xr=ROUND(x)>
<cfset xl=len(xr)>
<ul>
    <li>Round(7.49) : <cfoutput>#Round(7.49)#</cfoutput>
    <li>Round(7.5) : <cfoutput>#Round(7.5)#</cfoutput>
    <li>Round(-10.775) : <cfoutput>#Round(-10.775)#</cfoutput>
    <li>Round(1.2345*100)/100 :
    <cfoutput>#Evaluate(Round(1.2345*100)/100)#</cfoutput>
	<li>x= :<cfoutput>#x#</cfoutput></li>
	<li>xr= :<cfoutput>#xr#</cfoutput></li>
	<li>xl= :<cfoutput>#xl#</cfoutput></li>
	int
</ul>




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
