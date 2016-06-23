<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
</head>

<body>
<cfset ValidationResult = "Test">
<cfscript>
                              objXMLDOM = CreateObject("COM", "msxml2.DOMDocument.3.0");
                              objXMLDOM.async = false;
                              objXMLDOM.resolveExternals = false;
                              XMLloadSuccess = objXMLDOM.loadXML(test);
                              root = objXMLDOM.documentElement;
                              oNodes = root.childNodes;
                              for(i=0;i LT oNodes.length; i = i + 1){
                                   nodeItem = oNodes.item(i);
                                   nodeAttr = nodeItem.getAttribute("type");
                                   writeOutput("<LI>" & nodeAttr & "</LI>");
                              }

							  RemoveComObject(objXMLDOM);
                              </cfscript>



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
