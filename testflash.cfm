<html>
<head>
<meta http-equiv=Content-Type content="text/html;  charset=ISO-8859-1">
<title>Quick Start Videos</title>
<meta name="generator" content="Theater for Camtasia Studio 1.0">
<script language="JavaScript">
<!--
// To load a movie other then the first one listed in the xml file you can pass the number
// of the movie to load in the movieNum query string parameter.
// To load the third movie you would do the following:
//
// template.html?movieNum=3
//
var param = "";
var args = new Object();
var query = location.search.substring(1);
// Get query string
var pairs = query.split(",");
// Break at comma
for(var i = 0; i < pairs.length; i++) {
	var pos = pairs[i].indexOf('=');
	if (pos == -1) continue; // Look for "name=value"
	var argname = pairs[i].substring(0,pos); // If not found, skip
	var value = pairs[i].substring(pos+1); // Extract the name
	args[argname] = unescape(value); // Extract the value
}
if (args.movie) param = "?movieNum=" + parseInt(args.movie);
//-->
</script>

</head>
<body bgcolor="#FFFFFF">
<table width="792" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="1%"><img src="images/crn_toplft.gif" width="58" height="27"></td>
    <td width="99%" background="images/side_top.gif">&nbsp;</td>
    <td width="1%"><img src="images/crn_toprt.gif" width="58" height="27"></td>
  </tr>
</table>
<table width="792" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="1%" valign="top" background="images/side_left.gif"><img src="images/side_left.gif" width="13" height="126"></td>
    <td width="99%"><!-- URL's used in the movie-->
      <!-- text used in the movie-->
      <script language="JavaScript">
		<!--
      		document.write("<object classid=\"clsid:D27CDB6E-AE6D-11cf-96B8-444553540000\"" );
      		document.write("codebase=\"https://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0\"" );
      		document.write("width=\"800\" height=\"600\" id=\"movie\" align=\"\">" );
      		document.write("<param name=movie value=\"testflash.swf" + param + "\">" );
      		document.write("<param name=quality value=high>" );
      		document.write("<param name=bgcolor value=#FFFFFF>" );
      		document.write("<embed src=\"testflash.swf" + param + "\" quality=high bgcolor=#FFFFFF width=\"800\" height=\"600\" name=\"movie\" align=\"\"" );
 			document.write("type=\"application/x-shockwave-flash\" pluginspage=\"https://www.macromedia.com/go/getflashplayer\" swLiveConnect=\"false\"></embed>");
      		document.write("</object>");
      //-->
	</script>
	<noscript>
		<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="https://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0"
      		width="800" height="600" id="movie" align="">
      		<param name=movie value="testflash.swf">
      		<param name=quality value=high>
      		<param name=bgcolor value=#FFFFFF>
      		<embed src="testflash.swf" quality=high bgcolor=#FFFFFF width="800" height="600" name="movie" align=""
 			type="application/x-shockwave-flash" pluginspage="https://www.macromedia.com/go/getflashplayer" swLiveConnect="false"></embed>
      	</object>
	</noscript>
    </td>
    <td width="1%" valign="top" background="images/side_rt.gif"><img src="images/side_rt.gif" width="13" height="126"></td>
  </tr>
</table>
<table width="792" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="1%"><img src="images/crn_btmlft.gif" width="58" height="31"></td>
    <td width="99%" background="images/side_btm.gif">&nbsp;</td>
    <td width="1%"><img src="images/crn_btmrt.gif" width="58" height="31"></td>
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
