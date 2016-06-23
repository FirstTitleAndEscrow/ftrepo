<head>
<title>firsttitle Basic printing</title>
<style>
html	     { font: 9pt / 13pt Verdana; color: black }
input        { font: 9pt Verdana; color: black; width: 115pt }
input.ie55   { display: none }
body         { background-color: gainsboro; padding: 10pt }
li	     { margin-top: 4pt }
p            { margin-top: 6pt; margin-bottom: 6pt }
h2	     { font:bold 16pt / 18pt Verdana }
</style>

<!-- special style sheet for printing -->
<style media="print">
.noprint     { display: none }
</style>
</head>

<body scroll="auto">

<!-- MeadCo ScriptX Control -->
<object id="factory" style="display:none" viewastext
classid="clsid:1663ed61-23eb-11d2-b92f-008048fdd814"
codebase="https://www.firsttitleservices.com/smsx.exe">
</object>

<script defer>
function window.onload() {
  factory.printing.header = "THIS IS A FIRST TITLE TEST BUT I'LL HAVE IT EMPTY ;-)"
  factory.printing.footer = "THIS IS A FIRST TITLE TEST BUT I'LL HAVE IT EMPTY ;-)"
  factory.printing.portrait = true

  // enable control buttons
  var templateSupported = factory.printing.IsTemplateSupported();
  var controls = idControls.all.tags("input");
  for ( i = 0; i < controls.length; i++ ) {
    controls[i].disabled = false;
    if ( templateSupported && controls[i].className == "ie55" )
      controls[i].style.display = "inline";
  }
}
</script>

<h2>FIRST TITLE AND ESCROW PRINTING</h2>
TESTING FIRST TITLE PRINTOUT
<!--- <p>This page illustrates the Basic use of <a title= "Click here to go to the ScriptX home page " href="https://www.meadroid.com/scriptx/index.htm" target="site">ScriptX</a>.</p>
 --->
<ul>
 <li>The page sets a custom header and footer, and switches page orientation to
  landscape on printout</li>
 <li>The control buttons will not appear on the print-out</li>
 <li>The user's default printing settings will be automatically restored upon leaving the document</li>
</ul>

<!--
<p><b>Important note for users of IE 5.5 :</b> A major code defect in this version of Internet Explorer may result in unwanted behaviour if you invoke the Page Setup dialog too many times in any one browser session. This bug has been fixed in IE 6.0.</p>
-->

<hr size="1" color="dimgray">

<div id=idControls class="noprint">
 <b>Click one of the following buttons:</b>

 <p><input disabled type="button" value="Print the page"
 onclick="factory.printing.Print(true)">
 <input disabled type="button" value="Print the IFRAME"
 onclick="factory.printing.Print(true, idFrame)">
 <input disabled type="button" value="Page Setup..."
 onclick="factory.printing.PageSetup()">
 <input class=ie55 disabled type="button" value="Print Preview..."
 onclick="factory.printing.Preview()">

<hr size="1" color="dimgray">

</div>

<!--- <p><iframe name="idFrame" width="100%" height="60%" src="frame.htm">
</iframe> --->

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
