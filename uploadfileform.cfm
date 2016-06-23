<CFPARAM NAME="a_trigger" DEFAULT="0">
<CFPARAM NAME="user_name" DEFAULT="">
<CFPARAM NAME="lo_id" DEFAULT="0">
<CFPARAM NAME="comp_id" DEFAULT="">
<CFPARAM NAME="user_id_1" DEFAULT="0">
<CFPARAM NAME="title" DEFAULT="1">
<CFPARAM NAME="appraisal" DEFAULT="0">
<CFPARAM NAME="property" DEFAULT="0">
<CFPARAM NAME="other" DEFAULT="0">
<CFPARAM NAME="emp" DEFAULT="0">

<HTML>
<HEAD>
	<STYLE TYPE="text/css">
	body {background-attachment:fixed;scrollbar-base-color:#708090}
	.menu1 {color:#000000;font:normal bold 11px helvetica, geneva, sans serif;text-align:center;font-color:#000000}
	.menu1:link    {text-decoration:none;color:#000000;font:normal bold 11px helvetica, geneva, sans serif;}
	.menu1:visited {text-decoration:none;color:#000000;font:normal bold 11px helvetica, geneva, sans serif;}
	.menu1:hover   {font:normal bold 11px helvetica, geneva, sans serif;text-decoration:none;color:#FFFFFF}
</style>
    <TITLE>Upload Calyx File</TITLE>
</HEAD>
<BODY BGCOLOR="#ffffff" TEXT="#000000" LINK="#ff0000" VLINK="#800000" ALINK="#ff00ff" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth="0" MarginHeight="0">
<CENTER>
<table width=780 border="0" cellpadding="0" cellspacing="0" background="./images/back_03.gif">

   <tr>
  <td align = "middle">

<table width="770" height="110" border=0 cellpadding=0 cellspacing=0 background="/client/images/banner_black_wout_logo.jpg" valign="top">
  <tr>
    <td rowspan="2" valign="top" width="220"><cfinclude template="logo_swap_include.cfm"></td>
    <td valign="top" align="right"><br>

	<table border=0 align="right" cellpadding="0" cellspacing=0>
	<tr><td align="right" valign="center">
  <a href="./quicksearchhelp.cfm" target="quicksearch" onClick="window.open('','quicksearch','width=320,height=170,status=0,resizable=0,scrollbars=0')"><font size=2 color=red face=arial>Quick Search</font></a>
&nbsp;&nbsp;</td>
  <td align="right" valign="center"><input name="number" size=10 ></td>
  <td align="right" valign="center">&nbsp;<input type="image" src="/client/images/searchgo.jpg" border=0 alt="Begin your Web search"></td>
  </tr></table>

</td>
  </tr>
  <tr>
    <td valign="top" align="middle" width="560"><nobr></nobr><br>
      &nbsp;</td>
  </tr>
</table>


</td></tr></table>

<table width=780 border="0" cellpadding="0" cellspacing="0" background="./images/back_03.gif">

   <tr>
  <td>
<center>
<table cellpadding="1" cellspacing="1" bgcolor = "#000000" border="0" valign="top" width="770" height="25">
		<center>
<CFOUTPUT><TR></CFOUTPUT>

				<IMG src="./images/label_title.gif">
<H2>Specify File to upload</H2>

<!--- <CFFORM name = "frm" ACTION="./uploadfileaction.cfm?comp_id=#comp_id#&amp;user_id_1=#USER_ID_1#&amp;lo_id=#lo_id#&amp;title=#title#&amp;appraisal=#appraisal#&emp=#emp#"
 --->
 <CFFORM name = "frm" ACTION="./uploadfileaction.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&title=#title#&appraisal=#appraisal#&emp=#emp#"

  ENCTYPE="multipart/form-data"
          METHOD="POST">



<P>Click the 'Browse' button and navigate to the file saved by Calyx Point. This file is usually located at "C:\PointExp.txt".<br>

<INPUT TYPE="file" NAME="Filetoupload" SIZE="45" value="C:\PointExp.txt"> </P><br>



Once you have located the file, click "Submit Query" to submit your order.<br>
<INPUT TYPE="submit" VALUE="Submit Query">

          </FORM></TR></center></table></center></tr></table></CENTER> <script type="text/javascript">



  var _gaq = _gaq || [];

  _gaq.push(['_setAccount', 'UA-195021-17']);

  _gaq.push(['_trackPageview']);



  (function() {

    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;

    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'https://www') + '.google-analytics.com/ga.js';

    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);

  })();



</script>

</body> </HTML>
</CFFORM>
