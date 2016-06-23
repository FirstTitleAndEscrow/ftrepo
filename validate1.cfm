

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<html>
<head>
<script language="javascript">
function checkBPhone() {
	if (document.frm.bwphone1.value=='' &&
		document.frm.bhphone1.value=='' ||
		document.frm.name.value=='') {
		alert('You must enter a Name, Member ID and/or Non-Member Email Address');
		return false;
	}

	if (document.frm.name.value=='' &&
		document.frm.b_address1.value=='' ||
		document.frm.b_phone.value=='') {
		alert('You must enter a Billing Name, Address and Phone Number');
		return false;
	}

	if (document.frm.s_name.value=='' &&
		document.frm.s_address1.value=='' ||
		document.frm.s_phone.value=='') {
		alert('You must enter a Shipping Name, Address and Phone Number');
		return false;
	}

return true;
}

function checkAddr() {
	var frm;

	frm=document.frm;
	if  (frm.same.checked) {
		frm.s_name.value=frm.name.value;
		frm.s_co_name.value=frm.b_co_name.value;
		frm.s_address1.value=frm.b_address1.value;
		frm.s_address2.value=frm.b_address2.value;
		frm.s_city.value=frm.b_city.value;
	    frm.s_state_option.value=frm.b_state_option.value;
		frm.s_state_input.value=frm.b_state_input.value;
		frm.s_zip.value=frm.b_zip.value;
		frm.s_phone.value=frm.b_phone.value;
		frm.s_country.value=frm.b_country.value;
		frm.s_fax.value=frm.b_fax.value;
	}
}

function copyAddr() {

}

function unsetAddr() {
	document.frm.same.checked=false;
}
</script>

</head>

	<title>MPI Book Store Registration Page</title>



<basefont face="Arial">
<body width="640" background="./images/back-10.gif" bgcolor="#ffffff" link="red" vlink="red">


<p><a href="https://oracle.cyberrealm.net/yin/MPI/bookstore/images/topimages/bookstore.map"><IMG ismap src="https://oracle.cyberrealm.net/yin/MPI/bookstore/images/topimages/bookstore.gif" alt="Welcome to MPIWeb" border="0"></a></p>

<table width="640" cellpadding="1" cellspacing="1" border="0">
<tr><td width="640" align="left" colspan=2 valign="top">
<font size="2">
<img src="./images/welcome.gif" border="0"  ><font size="2"><B>to the bookstore profile  section</B>.</font>
<p>
<br>
<font size=2 color=blue>
<B>PLEASE NOTE :</B> This form is for Members and Non-Members to Register.<p>
<B>MEMBERS</B> - your login ID is your MPI Member ID number. Your Password will be one that you choose.<br>
<B>NON-MEMBERS</B> - your login ID is your e-mail address. Your Password will be one that you choose.
</font>
</td>
</tr>

<tr><td width="125" align="left" valign="top">
<img src="./images/clear.gif" height=1 width=125>
<a href="./mpireg.cfm"><img border=0 src="./images/register.gif"></a><br>
<a href="./mem_login.cfm"><img border=0 src="./images/login_mem.gif"></a><br>
<a href="./nonmem_login.cfm"><img border=0 src="./images/login_non.gif"></a><br><p>
<a href="https://www.mpiweb.org"><img border=0 src="./images/home.gif"></a><br>
</td>

<td width=510 align=left valign=top>
<font size=2 color=black>

<CFFORM Method="POST" Action="./acceptreg.cfm" name="frm" onSubmit="return checkVars()">



<TABLE BORDER=0 CELLPADDING=2 cellspacing=2 width=510>


<TR>
<TD valign=top align=left colspan=2 width=510 bgcolor=#FFE76B>


<TABLE BORDER=0 CELLPADDING=2 cellspacing=2 width=510>


<TR>
<TD valign=top align=left colspan=2 width=510 bgcolor=#FFE76B>
<font color=red size=2>
<B>Login ID and Password to use. </B> <font size=1 color=black> <B>
(Fill out only one of the two sections below.) <br><font color=#940018>maroon (members)</font> or <font color=#00A0DD>blue(non-members)</font></B></font>
<br>
</td>
</tr>

<tr>
<td width=510 colspan=2 align=left valign=top bgcolor=#940018>
<img src="./images/clear.gif" height=1 width=510><br>
<font size=2 color=f1f1f1>
<B>Members Section</B><font size=2 color=white> (non-members - skip this section)</font>
</td>
</tr>


<tr>

<td width=255 align=right valign=top bgcolor=#940018>
<img src="./images/clear.gif" height=1 width=255><br>
<font size=2 color=f1f1f1>
MPI MEMBER ID
</td>
<td width=255 align=left valign=top bgcolor=#940018>
<img src="./images/clear.gif" height=1 width=255><br>
<INPUT TYPE="text" NAME="memberno" SIZE=15 maxlength=20>
</td>
</tr>

<tr>

<td width=255 align=right valign=top bgcolor=#940018>
<img src="./images/clear.gif" height=1 width=255><br>
<font size=2 color=f1f1f1>
Password<br>
<font size=1>(Members)</font>
</td>
<td width=255 align=left valign=top bgcolor=#940018>
<img src="./images/clear.gif" height=1 width=255><br>
<INPUT TYPE="password" NAME="mempass" SIZE=15 maxlength=20>
</td>
</tr>
</table>


<!------------------------------------------------------------------>


<TABLE BORDER=0 CELLPADDING=2 cellspacing=2 width=510>


<tr>
<td width=510  colspan=2 align=left valign=top bgcolor=#00A0DD>
<img src="./images/clear.gif" height=1 width=510><br>
<font size=2 color=black>
<B>Non - Members Section</B> <font size=2 color=black> (members - skip this section)</font>
</td>
</tr>


<tr>

<td width=255 align=right valign=top bgcolor=#00A0DD>
<img src="./images/clear.gif" height=1 width=255><br>
<font size=2 color=black>
E-mail address<br>
<font size=1>(Non-members)</font>
</td>
<td width=255 align=left valign=top bgcolor=#00A0DD>
<img src="./images/clear.gif" height=1 width=255><br>
<INPUT TYPE="text" NAME="nonmem_email" SIZE=30 maxlength=35>
</td>
</tr>

<tr>

<td width=255 align=right valign=top bgcolor=#00A0DD>
<img src="./images/clear.gif" height=1 width=255><br>
<font size=2 color=black>
Password<br>
<font size=1>(Non-Members)</font>
</td>
<td width=255 align=left valign=top bgcolor=#00A0DD>
<img src="./images/clear.gif" height=1 width=255><br>
<INPUT TYPE="password" NAME="nonmempass" SIZE=15 maxlength=20>
</td>
</tr>
</table>

<!------------------------------------------>



</td></tr>

<TR>
<TD valign=top align=left colspan=2 width=510 bgcolor=#D0D0D0>
<font color=blue size=4>
<B>Billing Information:</B>

</TD>
</TR>




<TR>
<TD valign=top align=right width=200 bgcolor=#F5F5F5>
<font color=#6B6B6B size=2>
Name <br>
<font size=1 color=gray>
(First and Last)
</font>
</TD>
<TD valign=top align=left width=300>
<INPUT TYPE="text" NAME="name" SIZE=30  maxlength=35>
</TD>
</TR>


<TR>
<TD valign=top align=right width=200 bgcolor=#F5F5F5>
<font color=#6B6B6B size=2>
Company Name <br>

</font>
</TD>
<TD valign=top align=left width=300>
<INPUT TYPE="text" NAME="b_co_name" SIZE=35  maxlength=35>
</TD>
</TR>


<TR>
<TD valign=top align=right width=200 bgcolor=#F5F5F5>
<font color=#6B6B6B size=2>
Address <br>
</TD>
<TD valign=top align=left width=300>
<INPUT TYPE="text" NAME="b_address1" SIZE=40 maxlength=35>
</TD>
</TR>


<TR>
<TD valign=top align=right width=200 bgcolor=#F5F5F5>
<font color=#6B6B6B size=2>
Address <br>
</TD>
<TD valign=top align=left width=300>
<INPUT TYPE="text" NAME="b_address2" SIZE=40 maxlength=35>
</TD>
</TR>


<TR>
<TD valign=top align=right width=200 bgcolor=#F5F5F5>
<font color=#6B6B6B size=2>
City<br>
</TD>
<TD valign=top align=left width=300>
<INPUT TYPE="text" NAME="b_city" SIZE=20 maxlength=20>
</TD>
</TR>




<TR>
<TD valign=top align=right width=200 bgcolor=#F5F5F5>
<font color=#6B6B6B size=2>
State or Province<br>
<font color=#6B6B6B size=1>(ONLY use selection for state if in US)
</TD>
<TD valign=top align=left width=300>


<select name="b_state_option">
<option value="">State
<cfoutput query="gettaxinfo">
<option value="#state#">#state#
</cfoutput>
</select>
<INPUT TYPE="text" NAME="b_state_input" SIZE=20 maxlength=25>
</TD>
</TR>



<TR>
<TD valign=top align=right width=200 bgcolor=#F5F5F5>
<font color=#6B6B6B size=2>
Country<br>
</TD>
<TD valign=top align=left width=300>
<INPUT TYPE="text" NAME="b_country" SIZE=23 maxlength=22>
</TD>
</TR>


<TR>
<TD valign=top align=right width=200 bgcolor=#F5F5F5>
<font color=#6B6B6B size=2>
Zip or Postal Code<br>
</TD>
<TD valign=top align=left width=300>
<INPUT TYPE="text" NAME="b_zip" SIZE=15 maxlength=15>
</TD>
</TR>


<TR>
<TD valign=top align=right width=200 bgcolor=#F5F5F5>
<font color=#6B6B6B size=2>
E-mail address<br>

</TD>
<TD valign=top align=left width=300>
<INPUT TYPE="text" NAME="email" SIZE=25 maxlength=40>
</TD>
</TR>

<TR>
<TD valign=top align=right width=200 bgcolor=#F5F5F5>
<font color=#6B6B6B size=2>
Phone<br>
</TD>
<TD valign=top align=left width=300>
<INPUT TYPE="text" NAME="b_phone" SIZE=15 maxlength=18>
</TD>
</TR>


<TR>
<TD valign=top align=right width=200 bgcolor=#F5F5F5>
<font color=#6B6B6B size=2>
Fax <br>
</TD>
<TD valign=top align=left width=300>
<INPUT TYPE="text" NAME="b_fax" SIZE=15 maxlength=18>
</TD>
</TR>





<!------ Check box if billing same as shipping  --------------->

<TR>
<TD valign=top align=left colspan=2 width=390 bgcolor=#D6C572>
<font color=black size=2>
If billing and shipping information is the same, then check this box.
<br><font color=red size=2>
<img src="./images/right.gif"><input type="checkbox"  name="same" onClick="checkAddr()"><img src="./images/left.gif"> Yes, billing is same as shipping info.

</TD>
</TR>






<!------ Collect Shipping Data --------------->












<TR>
<TD valign=top align=left colspan=2 width=510 bgcolor=#D0D0D0>
<font color=maroon size=4>
<B>Shipping Information:</B>

</TD>
</TR>




<TR>
<TD valign=top align=right width=200 bgcolor=#F5F5F5>
<font color=#6B6B6B size=2>
Name <br>
<font size=1 color=gray>
(First and Last)
</font>
</TD>
<TD valign=top align=left width=300>
<INPUT TYPE="text" NAME="s_name" onChange="unsetAddr()" SIZE=30 maxlength=35>
</TD>
</TR>


<TR>
<TD valign=top align=right width=200 bgcolor=#F5F5F5>
<font color=#6B6B6B size=2>
Company Name <br>

</font>
</TD>
<TD valign=top align=left width=300>
<INPUT TYPE="text" NAME="s_co_name" onChange="unsetAddr()" SIZE=35 maxlength=35>
</TD>
</TR>


<TR>
<TD valign=top align=right width=200 bgcolor=#F5F5F5>
<font color=#6B6B6B size=2>
Address <br>
</TD>
<TD valign=top align=left width=300>
<INPUT TYPE="text" NAME="s_address1" onChange="onsetAddr()" SIZE=35 maxlength=35>
</TD>
</TR>


<TR>
<TD valign=top align=right width=200 bgcolor=#F5F5F5>
<font color=#6B6B6B size=2>
Address <br>
</TD>
<TD valign=top align=left width=300>
<INPUT TYPE="text" NAME="s_address2" onChange="onsetAddr()" SIZE=35 maxlength=35>
</TD>
</TR>


<TR>
<TD valign=top align=right width=200 bgcolor=#F5F5F5>
<font color=#6B6B6B size=2>
City<br>
</TD>
<TD valign=top align=left width=300>
<INPUT TYPE="text" NAME="s_city" onChange="unsetAddr()" SIZE=20 maxlength=20>
</TD>
</TR>




<TR>
<TD valign=top align=right width=200 bgcolor=#F5F5F5>
<font color=#6B6B6B size=2>
State or Province<br>
<font color=#6B6B6B size=1>(ONLY use select for state if in US)
</TD>
<TD valign=top align=left width=300>


<select name="s_state_option">
<option value="">State
<cfoutput query="gettaxinfo">
<option value="#state#">#state#
</cfoutput>
</select>
<INPUT TYPE="text" NAME="s_state_input" onChange="unsetAddr()" SIZE=20 maxlength=25>


</TD>
</TR>



<TR>
<TD valign=top align=right width=200 bgcolor=#F5F5F5>
<font color=#6B6B6B size=2>
Country<br>
</TD>
<TD valign=top align=left width=300>
<INPUT TYPE="text" NAME="s_country" onChange="unsetAddr()" SIZE=20 maxlength=22>
</TD>
</TR>


<TR>
<TD valign=top align=right width=200 bgcolor=#F5F5F5>
<font color=#6B6B6B size=2>
Zip or Postal Code<br>
</TD>
<TD valign=top align=left width=300>
<INPUT TYPE="text" NAME="s_zip" onChange="unsetAddr()" SIZE=15 maxlength=19>
</TD>
</TR>

<TR>
<TD valign=top align=right width=200 bgcolor=#F5F5F5>
<font color=#6B6B6B size=2>
Phone<br>
</TD>
<TD valign=top align=left width=300>
<INPUT TYPE="text" NAME="s_phone" onChange="unsetAddr()" SIZE=15 maxlength=18>
</TD>
</TR>


<TR>
<TD valign=top align=right width=200 bgcolor=#F5F5F5>
<font color=#6B6B6B size=2>
Fax <br>
</TD>
<TD valign=top align=left width=300>
<INPUT TYPE="text" NAME="s_fax" onChange="unsetAddr()" SIZE=15 maxlength=18>
</TD>
</TR>





</SELECT>

<TR><TD colspan=2><center><input type=submit name="Submit" VALUE="Click Here to Submit"></center>

</CFFORM>
</TD></TR>


</TABLE>

</center></td>
</tr>

<tr><td width="640" align="left" colspan=2 valign="top">



<p>
<hr width="600">
<p>
<font size="1"> <b>DISCLAIMER:</b><p>


 The links on this Web site are provided only for the convenience of MPIWeb site visitors. MPI has no interest in, responsibility for, or control over the linked site. MPI makes no promises or warranties of any kind, express or implied, including those of merchantability and fitness for a particular purpose, as to the content of the linked site. In no event shall MPI be liable for any damages resulting from use of these links even if MPI has been informed of the possibility of such liability.</font>
<p>
<hr width="600">
<p>


<table width="640" cellpadding="4" cellspacing="4" border="0">

<tr><td width="200" align="center" valign="top">

<font SIZE="1">Meeting Professionals International<br>
<b>International Headquarters</b><br>
4455 LBJ Freeway, Suite 1200<br>Dallas, Texas, U.S.A. 75244-5903<br>
Voice: +1-972-702-3000<br>
Fax: +1-972-702-3070

<p>
</font>

</td>

<td width="200" align="center" valign="top">

<font size="1">

<p><b>

© 1997, 1998 Meeting Professionals International, Dallas, TX.<br>

All rights reserved.<br>

Updated 20 October 1998<br>

E-Mail Feedback: <a HREF="mailto:feedback@mpiweb.org">feedback@mpiweb.org</a></b>

</font>

</td>

<td width="200" align="center" valign="top">

<font SIZE="1">

Meeting Professionals International<br>
<b>MPI European Office</b><br>
Bld. St. Michel, 15<br>
B-1040 Brussels, Belgium<br>
Voice: +32-2-743.15.44<br>
Fax: +32-2-743.15.50<br>

</font>

</td>
</tr>
</table>

</td>
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
