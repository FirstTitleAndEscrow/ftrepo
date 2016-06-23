<CFPARAM NAME="a_trigger" DEFAULT="0">
<CFPARAM NAME="comp_id" DEFAULT="">
<CFPARAM NAME="pass" DEFAULT="">
<CFPARAM NAME="txtfield" DEFAULT="">

<!---The comp-id is really the user name for the company and
the password is their password.  This is carried over from the Dynatek Plug_In.--->
<CFQUERY datasource="#request.dsn#" NAME="read_company">
	SELECT *
	FROM companies
	WHERE a_user = '#comp_id#' and a_pass = '#pass#' and a_status = 1
</CFQUERY>

<html>
<head>
<title>Dynatek Login</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
 <!--- P {font:bold 11px Courier,Verdana,Tahoma,Arial} --->
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);
//-->
</script>

<STYLE TYPE="text/css">
	body {background-attachment:fixed;scrollbar-base-color:#708090}
	.menu1 {color:#000000;font:normal bold 11px helvetica, geneva, sans serif;text-align:center;font-color:#000000}
	.menu1:link    {text-decoration:none;color:#000000;font:normal bold 11px helvetica, geneva, sans serif;}
	.menu1:visited {text-decoration:none;color:#000000;font:normal bold 11px helvetica, geneva, sans serif;}
	.menu1:hover   {font:normal bold 11px helvetica, geneva, sans serif;text-decoration:none;color:#FFFFFF}
</style>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" bgcolor="#294163" link="#ff0000" vlink="#ff0000" alink="#ff0000">
<TABLE><CFFORM NAME="frm" ACTION="./title_abstract_doc_view.cfm?" METHOD=POST>
<tr>
	<td>
		Testing
	</td>
</tr>
	<td>
	<CFINPUT TYPE="text" NAME="#txtfield#" SIZE="100" VALUE="#txtfield#">

	</td></CFFORM>
 </TABLE>


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
