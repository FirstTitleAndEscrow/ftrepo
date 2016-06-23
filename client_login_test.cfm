
		<CFQUERY datasource="#request.dsn#" NAME="read_content">

			SELECT *
			FROM web_site
			WHERE page_id = 4

		</CFQUERY>


<html>
<head>
<META HTTP-EQUIV="Content-type" CONTENT="text/html; charset=iso-8859-1">

<META HTTP-EQUIV="Content-type" CONTENT="text/html; charset=iso-8859-2">
<META HTTP-EQUIV="Creation-date" CONTENT="2002-03-17T14:25:14Z">
<META HTTP-EQUIV="Content-Language" CONTENT="pl">
<META NAME="Author" CONTENT="Bogdan B³aszczak">
<title>1st Title & Escrow, Inc. - <CFOUTPUT>#read_content.page_title#</CFOUTPUT></title>

<cfoutput>
<LINK REL="stylesheet" HREF="https://#cgi.server_name#/blatekcsmenu2/styl.css" TYPE="text/css">
 <STYLE TYPE="text/css">

P {color:##666666;font:italic bold 14px Courier,Verdana,Tahoma,Arial}
.opis {color:##000000;font:normal normal 12px Courier,Verdana,Tahoma,Arial}
.kod {font-weight:bold}
.stopka {text-align:center;color:##000000;font:italic normal 9pt Arial,sans-serif}
##wrst {position:relative}

.menu1 {font:normal bold 13px Arial, Helvetica, sans-serif;text-align:center;background-color:green}
.menu1:link    {text-decoration:none;color:##FFFFFF}
.menu1:visited {text-decoration:none;color:##FFFFFF}
.menu1:hover   {text-decoration:none;color:##666666;background-color:##FFFF33}

</STYLE>

<script TYPE="text/javascript" language="JavaScript" src='https://#cgi.server_name#/blatekcsmenu2/menu/demomenu.js'></script>
<script language="JavaScript">
</cfoutput>
<!--

window.onerror = null;
var menuActive = 0;
var menuOn = 0;
var onLayer = null;
var timeOn = null;

isIE = (document.all ? true : false);
isDOM = (document.getElementById ? true : false);

function getDivStyle(divname) {
 var style;
 if (isDOM) { style = document.getElementById(divname).style; }
 else { style = isIE ? document.all[divname].style
                     : document.layers[divname]; } // NS4
 return style;
}

function hideElement(divname) {
 getDivStyle(divname).visibility = 'hidden';
}

function showElement(divname) {
 divstyle = getDivStyle(divname);
   if (timeOn != null) {
    clearTimeout(timeOn);
    hideElement(onLayer);
   }
   divstyle.visibility = 'visible';
   onLayer = divname;
}

function tabTimer() {
 timeOn = setTimeout("tabOut()",1000);
}

function tabOut() {
 if (menuActive == 0) {
  hideElement(onLayer);
  }
}

function menuOver() {
 clearTimeout(timeOn);
 menuActive = 1;
}

function menuOut() {
 menuActive = 0;
 timeOn = setTimeout("tabOut()", 1000);
}

//-->
</script>
<cfoutput><link rel="stylesheet" href="https://#cgi.server_name#/new/stalker.css" type="text/css"></cfoutput>
</head>
<body bgcolor="#FFFFFF" onLoad="initMenu()" text="#000000" link="#0000FF" vlink="#0000CC" alink="#FF0000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">



<SCRIPT TYPE="text/javascript" LANGUAGE="JavaScript">

DeclareMenu()
MC_BlaTek.onbeforeshow=Ciemno;
MC_BlaTek.onafterhide=Jasno;

function Ciemno(){
getLayer('wrst').visibility="hidden"
document.bgcolor="#FDF7E7"
}

function Jasno(){
getLayer('wrst').visibility="visible"
document.bgcolor="#FDF7E7"
}

function getLayer(id){
var d=document;
return d.layers?d.layers[id]:
d.getElementById?d.getElementById(id).style:d.all[id].style;
}

</SCRIPT>
<table width="750" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td bgcolor="#000000" width="180"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/new/pictures/1blank.gif" width="180" height="8"></td>
    <td bgcolor="#000000"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/new/pictures/1blank.gif" width="350" height="8"></td>
    <td width="200" bgcolor="#000000"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/new/pictures/1blank.gif" width="200" height="8"></td>
  </tr>
  <tr>
    <td bgcolor="#000000" align="center"><a href="https://<cfoutput>#cgi.server_name#</cfoutput>/new/"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/new/pictures/globe2.gif" width="90" height="70" border="0" alt="<cfoutput>#session.site.short_name#</cfoutput>"></a></td>
    <td colspan="2" background="https://<cfoutput>#cgi.server_name#</cfoutput>/new/pictures/" valign="top"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>

<td>
	   <cfoutput><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="https://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab##version=6,0,29,0" width="570" height="90">
                                <param name="movie" value="https://#cgi.server_name#/new/ft_flash1.swf">
                                <param name="quality" value="high">
								<param name="loop" value="false">
                                <embed src="https://#cgi.server_name#/new/ft_flash1.swf" quality="high" loop = "false" pluginspage="https://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="570" height="90"></embed></object></cfoutput>

	  </td>
	  </tr>
      </table>
    </td>
  </tr>
</table>
<table width="750" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td bgcolor="#000000"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/new/pictures/1blank.gif" width="750" height="1"></td>
  </tr>
  <tr>
    <td bgcolor="#1E71FD">
      <table width="750" border="0" cellspacing="1" cellpadding="2">
        <tr align="center">
          <td width="174" nowrap><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/new/pictures/1blank.gif" width="174" height="8"></td>
          <td width="89" bgcolor="#0099FF" nowrap onmouseover="this.bgColor='#1E71FD'" onmouseout="this.bgColor='#0099FF'" onClick="document.location.href='https://<cfoutput>#cgi.server_name#</cfoutput>/company_info.cfm';return false;"><a href="https://<cfoutput>#cgi.server_name#</cfoutput>/company_info.cfm"><font color="#FFFFFF"><nobr>Company</nobr></font></a></td>
          <td width="89" bgcolor="#0099FF" nowrap onmouseover="this.bgColor='#1E71FD'" onmouseout="this.bgColor='#0099FF'" onClick="document.location.href='https://<cfoutput>#cgi.server_name#</cfoutput>/new/contact_info.cfm';return false;"><a href="https://<cfoutput>#cgi.server_name#</cfoutput>/new/contact_info.cfm"><font color="#FFFFFF"><nobr>Contact</nobr></font></a></td>
          <td width="89" bgcolor="#0099FF" nowrap onmouseover="this.bgColor='#1E71FD'" onmouseout="this.bgColor='#0099FF'" onClick="document.location.href='https://<cfoutput>#cgi.server_name#</cfoutput>/client_login.cfm';return false;"><a href="https://<cfoutput>#cgi.server_name#</cfoutput>/client_login.cfm"><font color="#FFFFFF"><nobr>Place Orders</nobr></font></a></td>
          <td width="89" bgcolor="#0099FF" nowrap onmouseover="this.bgColor='#1E71FD'" onmouseout="this.bgColor='#0099FF'" onClick="document.location.href='https://<cfoutput>#cgi.server_name#</cfoutput>/new/contact_info.cfm';return false;"><a href="https://<cfoutput>#cgi.server_name#</cfoutput>/new/contact_info.cfm"><font color="#FFFFFF">Vendors</font></a></td>
          <td width="89" bgcolor="#0099FF" nowrap onmouseover="this.bgColor='#1E71FD'" onmouseout="this.bgColor='#0099FF'" onClick="document.location.href='https://<cfoutput>#cgi.server_name#</cfoutput>/new/';return false;"><a href="https://<cfoutput>#cgi.server_name#</cfoutput>/new/"><font color="#FFFFFF"><nobr>Home</nobr></font></a></td>
          <td width="89" bgcolor="#0099FF" nowrap onmouseover="this.bgColor='#1E71FD'" onmouseout="this.bgColor='#0099FF'" onClick="document.location.href='https://<cfoutput>#cgi.server_name#</cfoutput>/new/contacts.html';return false;"><a href="https://<cfoutput>#cgi.server_name#</cfoutput>/new/contacts.html"><font color="#FFFFFF"></font></a></td>
           </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td bgcolor="#000000"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/new/pictures/1blank.gif" width="750" height="1"></td>
  </tr>
</table>
<table width="750" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="180" valign="top" bgcolor="#000000">
      <table width="180" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/new/pictures/1blank.gif" width="180" height="10"></td>
        </tr>
        <tr>
          <td>
           <table width="100%" border="0" cellspacing="1" cellpadding="2">

              <tr align="left">


  <td align="left" bgcolor = "#E8EBA9" width="190"><font size=3 color=RED face=arial><B>&nbsp;Real Estate Solutions</B></td></tr>
<tr align="left"><td align="left" class="menu1"  width="190"><A class="menu1" HREF="javascript:void(0)" onmouseover="pMenu(1,'P_flash',4,180,152)">Closing Management</A></td></tr>
<tr align="left"><td align="left" class="menu1"  width="190"><A class="menu1" HREF="javascript:void(0)" onmouseover="pMenu(1,'P_flash2',4,180,175)">Title Insurance</A></td></tr>
<tr align="left"><td align="left" class="menu1"  width="190"><A class="menu1" HREF="javascript:void(0)" onmouseover="pMenu(1,'P_flash3',4,180,194)">Collateral Assessment</A></td></tr>
<tr align="left"><td align="left" class="menu1"  width="190"><A class="menu1" HREF="javascript:void(0)" onmouseover="pMenu(1,'P_flash4',4,180,218)">Risk Assessment</A></td></tr>


     <tr align="left" ><td align="left" class="menu1"  width="190">
	    <div id="wrst">

</div></td></tr>
</table>
          </td>
        </tr>
        <tr>
          <td valign="top">
            <div align="center"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/new/pictures/1blank.gif" width="150" height="70"><br>
             <!---  <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/new/pictures/header_syst.gif" width="150" height="18"><br>
              <a href="https://<cfoutput>#cgi.server_name#</cfoutput>/new/bundles.html"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/new/ft_image01.jpg" width="144" height="180" border="0"></a>
			  ---> </div>
          </td>
        </tr>
      </table>
    </td>
    <td valign="top" background="https://<cfoutput>#cgi.server_name#</cfoutput>/new/pictures/bg1.gif">
      <table width="100%" border="0" cellspacing="0" cellpadding="10">
        <tr>
          <td valign="top">
            <div align="center"> <!---<a href="https://<cfoutput>#cgi.server_name#</cfoutput>/new/cpro/"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/new/pictures/" width="350" height="120" border="0"></a><br>
              <b> <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/new/pictures/" width="350" height="25" alt="Latest Reviews">
              </b> ---></div>
          </td>
        </tr>
      </table>
    </td>
    <td valign="top" background="https://<cfoutput>#cgi.server_name#</cfoutput>/new/pictures/bg1.gif">
      <table width="100%" border="0" cellspacing="0" cellpadding="10">
        <tr>
          <td valign="top">
            <div align="center"> <!---<a href="https://<cfoutput>#cgi.server_name#</cfoutput>/new/cpro/"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/new/pictures/" width="350" height="120" border="0"></a><br>
              <b> <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/new/pictures/" width="350" height="25" alt="Latest Reviews">
              </b> ---></div>
<center>
<CFFORM action="https://#cgi.server_name#/client_login_submit.cfm">
	<table bgcolor=gray border="0" align="center" width=354 cellpadding="1" cellspacing="1">
		<tr>
			<td bgcolor=d3d3d3 colspan="2" width=354 align="center" valign="top">
			<font face="Arial" size="2" color="Black">
			<b>Client Login</b>
			</font>
			</td>
		</tr>
		<tr>
			<td bgcolor=d3d3d3 width="130" align="right" valign="top">
		  		<font face="arial" size="2" color="black">
			User Name:
				</font>
			</td>

			<td bgcolor=f1f1f1 width="145" align="center" valign="top" bgcolor="a2a3fe">
				<cfinput NAME="user_name" SIZE="25" MAXLENGTH="25" TABINDEX="1" required="yes" message="You must Enter your User Name "
					style="font-size: 9;
					font-family: verdana;
					font-style: normal;
					color: blue;
					background-color: E4E3E3;
					border-color: white;
					border-left-width: thin;
					border-right-width: thin;
					border-top-width: thin;
					border-bottom-width: thin;
					border-width: thin;
					border-style: bar;
					clear: none;" >
			</td>
		</tr>

        <tr>
			<td bgcolor=d3d3d3 width="130" align="right" valign="top">
				<font face="arial" size="2" color="black">
			Password:
				</font>
			</td>

			<td bgcolor=f1f1f1 width="145" align="center" valign="top" bgcolor="a2a3fe">
				<cfinput TYPE="password" NAME="password" SIZE="25" MAXLENGTH="25" TABINDEX="2" required="yes" message="You must Enter your Password"
					style="font-size: 9;
					font-family: verdana;
					font-style: normal;
					color: blue;
					background-color: E4E3E3;
					border-color: white;
					border-left-width: thin;
					border-right-width: thin;
					border-top-width: thin;
					border-bottom-width: thin;
					border-width: thin;
					border-style: bar;
					clear: none;" >
			</td>
        </tr>
		</table>

	<table  border="0" align="center" width=275 cellpadding="1" cellspacing=1>
        <tr>
			<td bgcolor=white colspan="2" width=275 align="right" valign="top">
				<p>
				<br>
				<input type="image" border=0 src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/button_login.gif">
			</td>
		</tr>

	</table>
</cfform>


<p>
<CENTER>

<BR>
<HR color="#808080" SIZE="1">
	</TD>
  </TR>
  <TR>
    <TD align=middle><FONT face="Verdana, Arial, Helvetica" size="1">Copyright © 1998 <A href="mailto:SPAPE@Firsttitleservices.com">Mortgage Information Services</A></FONT></TD>
  </TR>
  </TBODY>
</TABLE>

</CENTER>
</FONT>
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
</HTML>