<cfquery name="getstate" DATASOURCE="First_Title_Services">
SELECT state FROM taxtable ORDER BY state
</cfquery>

 <CFQUERY DATASOURCE="First_Title_Services" NAME="getcompany">
SELECT *
FROM login
WHERE loginid=#loginid#
</CFQUERY>




<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<CFSET datnow = "#DateFormat(Now())#">
<CFSET timnow = "#TimeFormat(Now())#">
<cfparam name="choice" default="">



<html>
<head>


<!---<script language="javascript">
function checkBPhone() {
	if (document.frm.bwphone1.value=='')
		//document.frm.bhphone1.value=='')
		{
		alert('You must enter the first borrower's work phone no. or his home phone no..');
		return false;
	     }

	//if (document.frm.name.value=='' &&
		//document.frm.b_address1.value=='' ||
		//document.frm.b_phone.value=='') {
		//alert('You must enter a Billing Name, Address and Phone Number');
		//return false;
	return true;
	}

</script>--->





	<title>1st Title & Escrow, Inc. - Welcome</title>
</head>

<body leftmargin="0" topmargin="0" marginheight = "0" marginwidth = "0">
<table width=620 border="0" cellpadding="0" cellspacing="0"><td colspan="2" valign=bottom><IMG height=1 src="./images/clear.gif" width=10><IMG src="./images/logo.gif"><b><font size=2 color=red face=arial><IMG height=1 src="./images/clear.gif" width=30><cfoutput> #datnow# - #timnow#</CFOUTPUT> (EST)</b></FONT><img src="images/clear.gif" width=69 height=1 alt="" border="0">
<a href="./welcome.cfm"><img src="images/home.gif" width=55 height=18 alt="" border="0"></a></td></tr><tr><td colspan="2" valign="top"><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/bar.gif"></td></tr><tr><td width="145" valign="top"><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_01.gif"><br><IMG height=1 src="./images/clear.gif" width=20><a href="./title_services.cfm"><IMG src="./images/nav_02.gif" border=0></a><br><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_03.gif"><br><IMG height=1 src="./images/clear.gif" width=20><a href="./closing_services.cfm"><IMG src="./images/nav_04.gif" border=0></a><br><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_05.gif"><br><IMG height=1 src="./images/clear.gif" width=20><A href="./customer_login.cfm"><IMG border=0 src="./images/nav_06.gif"></a><br><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_07.gif"><br><IMG height=1 src="./images/clear.gif" width=20><a href="./contact_info.cfm"><IMG src="./images/nav_08.gif" border=0></a><br><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_09.gif"><br><IMG height=1 src="./images/clear.gif" width=20><a href="./mail.cfm?pass=0"><IMG src="./images/nav_10.gif" border=0></a><br><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_11.gif"><br><IMG height=1 src="./images/clear.gif" width=20><br></TD><TD>

<TABLE WIDTH=440 BORDER=0 CELLSPACING=0 align="center">
<TR>
<TD ALIGN=middle><cfoutput query="getcompany">
<FONT FACE=ARIAL COLOR="red" SIZE=4><b>Welcome:&nbsp;#company#</b></FONT>
<p>You will receive your report in approximately 72 hours.<BR>
Please indicate the expected closing date if this is a rush order.<BR>
You may check the <a href="./order_status.cfm?loginid=1&acct_num=#acct_num#&password=#password#">order status</a> in Account Menu.<p>
<A href="./help.htm" target=new>Click Here for Help</a></cfoutput>
<HR>
<CENTER>


<!---- Account Information--->


<TABLE BORDER=1 CELLSPACING=0 width=520 bgcolor="#a2a3fe">
<CFFORM Name="frm"  ACTION="./order_verify.cfm?loginid=#loginid#" METHOD=POST>


<TR BGCOLOR="blue">
<TD ALIGN=middle colspan=4>
<FONT FACE=ARIAL SIZE=2 color="white">
<B>C L I E N T &nbsp; S P E C I F I C  &nbsp I N F O R M A T I O N</B></FONT>
</TD></TR>

<TR>
<TD bgcolor="#a2a3fe" colspan=4>
<FONT FACE=ARIAL SIZE=2 color="black"><b>Unit No./Loan Officer:</b></FONT>
</td>
</tr>

<tr>
<td bgcolor="#a2a3fe" width=""><FONT FACE=ARIAL SIZE=2 color="black">
Unit No./Name (Last, First)<br>
<CFINPUT NAME="oname" size=15 maxlength=25 message="Please enter the officer's full name." required="yes">
</td>

<td bgcolor="#a2a3fe" width=""><FONT FACE=ARIAL SIZE=2 color="black">
Phone No.<br>
<CFINPUT NAME="ophone" message="Please enter the officer's phone no. in the format of xxx-xxx-xxxx." required="yes" validate="telephone"  size=10 maxlength=15>
</td>

<td bgcolor="#a2a3fe" width=""><FONT FACE=ARIAL SIZE=2 color="black">
Ext.<br>
<CFINPUT NAME="oext" size=5 maxlength=15 message="Please enter an integer for the loan officer's Ext." validate="integer">
<input type="hidden" name="oext_integer" value="Please enter an integer for the officer's Ext.">
</td>

<td bgcolor="#a2a3fe" width=""><FONT FACE=ARIAL SIZE=2 color="black">
Fax No.<br>
<CFINPUT NAME="ofax" message="Please enter the office's fax no. in the format of xxx-xxx-xxxx." validate="telephone"  size=10 maxlength=15>
</td>
</tr>

<TR>
<TD COLSPAN=4  bgcolor="#a2a3fe"><FONT FACE=ARIAL SIZE=2 color="black"><b>Loan Processor:</b></FONT>
</td>
</tr>


<tr>
<td bgcolor="#a2a3fe" width=""><FONT FACE=ARIAL SIZE=2 color="black">
Name (Last, First)<br>
<INPUT NAME="pname" size=15 maxlength=25></td>

<td bgcolor="#a2a3fe" width=""><FONT FACE=ARIAL SIZE=2 color="black">
Phone No.<br>
<CFINPUT NAME="pphone" message="Please enter the processor's phone no. in the format of xxx-xxx-xxxx." validate="telephone"  size=10 maxlength=15>
</td>

<td bgcolor="#a2a3fe" width=""><FONT FACE=ARIAL SIZE=2 color="black">
Ext.<br>
<CFINPUT NAME="pext" size=5 maxlength=15 message="Please enter an integer for the loan processer's Ext." validate="integer">
<input type="hidden" name="pext_integer" value="Please enter an integer for the loan processer's Ext.">

</td>

<td bgcolor="#a2a3fe" width=""><FONT FACE=ARIAL SIZE=2 color="black">
Fax No.<br>
<CFINPUT NAME="pfax" message="Please enter the processor's fax no. in the format of xxx-xxx-xxxx." validate="telephone"  size=10 maxlength=15>
</td>

</tr>

<TR><TD bgcolor="#a2a3fe" colspan=4 align="center"><B>Because ordering requirements for different states vary, your report will be sent via email OR facsimile at the loan processor number listed above.</B></TD></TR>

</table>



<!---Borrower/Seller Information--->

<TABLE BORDER=1 CELLSPACING=0 width=520 bgcolor="#a2a3fe">

<TR BGCOLOR="blue">
<TD COLSPAN=7 ALIGN=middle>
<FONT FACE=ARIAL SIZE=2 color="white"><B>B O R R O W E R /S E L L E R &nbsp;&nbsp; I N F O R M A T I O N</B></FONT></TD></TR>

<TR bgcolor="#a2a3fe">
<TD width="" colspan=7><FONT FACE=ARIAL SIZE=2><b>Borrowers:</b>
</FONT>
</TD>
</tr>


<TR bgcolor="#a2a3fe">
<TD width=""><FONT FACE=ARIAL SIZE=2>Last Name<br>
<CFINPUT NAME="blastname1" message="Borrower's last name is required." required="Yes" size=10 maxlength=15>
<input type="hidden" name="blastname1_required" value="Borrower's last name is required."></FONT>
</TD>

<TD width=""><FONT FACE=ARIAL SIZE=2>First Name<br>
<CFINPUT NAME="bfirstname1" message="Borrower's first name is required." required="Yes" size=6 maxlength=15>
<input type="hidden" name="bfirstname1_required" value="Borrower's first name is required.">
</FONT>
</TD>

<TD width=""><FONT FACE=ARIAL SIZE=2>Mi<br>
<INPUT NAME="bminame1" size=1 maxlength=1 VALUE=""></FONT>
</TD>

<TD width=""><FONT FACE=ARIAL SIZE=2>SSN<br>
<CFINPUT NAME="bssn1" message="Please enter the borrower's social security no. in the format of xxx-xx-xxxx."   validate="social_security_number" size=10 maxlength=15>
</FONT>
</TD>

<TD width=""><FONT FACE=ARIAL SIZE=2>Home Phone<br>
<CFINPUT NAME="bhphone1" message="Please enter the borrower's home phone no. in the format of xxx-xxx-xxxx." validate="telephone"  size=10 maxlength=20>
</FONT>
</TD>

<TD width=""><FONT FACE=ARIAL SIZE=2>Work Phone<br>
<CFINPUT NAME="bwphone1" message="Please enter the borrower's work phone no. in the format of xxx-xxx-xxxx." validate="telephone" size=10 maxlength=20>
</FONT>
</TD>

<TD width=""><FONT FACE=ARIAL SIZE=2>Ext.<br>
<CFINPUT NAME="bext1" size=4 maxlength=10 message="Please enter an integer for the borrower's Ext." validate="integer">
<input type="hidden" name="bext1_integer" value="Please enter an integer for the borrower's Ext.">
</FONT>
</TD>
</TR>

<TR bgcolor="#a2a3fe">
<TD width=""><FONT FACE=ARIAL SIZE=2>
<INPUT NAME="blastname2" size=10 maxlength=15 VALUE=""></FONT>
</TD>

<TD width=""><FONT FACE=ARIAL SIZE=2>
<INPUT NAME="bfirstname2" size=6 maxlength=15 VALUE=""></FONT>
</TD>

<TD width=""><FONT FACE=ARIAL SIZE=2>
<INPUT NAME="bminame2" size=1 maxlength=15 VALUE=""></FONT>
</TD>

<TD width=""><FONT FACE=ARIAL SIZE=2>
<CFINPUT NAME="bssn2" message="Please enter the borrower's social security no. in the format of xxx-xx-xxxx."  validate="social_security_number" size=10 maxlength=15>
</FONT>
</TD>

<TD width=""><FONT FACE=ARIAL SIZE=2>
<CFINPUT NAME="bhphone2" message="Please enter the borrower's home phone no. in the format of xxx-xxx-xxxx." validate="telephone" size=10 maxlength=20>
</FONT>
</TD>

<TD width=""><FONT FACE=ARIAL SIZE=2>
<CFINPUT NAME="bwphone2" message="Please enter the borrower's work phone no. in the format of xxx-xxx-xxxx." validate="telephone" size=10 maxlength=20>
</FONT>
</TD>

<TD width=""><FONT FACE=ARIAL SIZE=2>
<CFINPUT NAME="bext2" size=4 maxlength=10 message="Please enter an integer for the borrower's Ext." validate="integer">
<input type="hidden" name="bext2_integer" value="Please enter an integer for the borrower's Ext."></FONT>
</TD>
</TR>


<TR bgcolor="#a2a3fe">
<TD width="" colspan=7><FONT FACE=ARIAL SIZE=2><b>Sellers:</b>
</FONT>
</TD>
</tr>

<TR bgcolor="#a2a3fe">
<TD width=""><FONT FACE=ARIAL SIZE=2>Last Name<br>
<INPUT NAME="slastname1" size=10 maxlength=15 VALUE=""></FONT>
</TD>

<TD width=""><FONT FACE=ARIAL SIZE=2>First Name<br>
<INPUT NAME="sfirstname1" size=6 maxlength=15 VALUE=""></FONT>
</TD>

<TD width=""><FONT FACE=ARIAL SIZE=2>Mi<br>
<INPUT NAME="sminame1" size=1 maxlength=15 VALUE=""></FONT>
</TD>

<TD width=""><FONT FACE=ARIAL SIZE=2>SSN<br>
<CFINPUT NAME="sssn1" message="Please enter the seller's social security no. in the format of xxx-xx-xxxx."  validate="social_security_number" size=10 maxlength=15>
</FONT>
</TD>

<TD width=""><FONT FACE=ARIAL SIZE=2>Home Phone<br>
<CFINPUT NAME="shphone1" message="Please enter the seller's home phone no. in the format of xxx-xxx-xxxx." validate="telephone" size=10 maxlength=20>
</FONT>
</TD>

<TD width=""><FONT FACE=ARIAL SIZE=2>Work Phone<br>
<CFINPUT NAME="swphone1" message="Please enter the seller's work phone no. in the format of xxx-xxx-xxxx." validate="telephone" size=10 maxlength=20> </FONT>
</TD>

<TD width=""><FONT FACE=ARIAL SIZE=2>Ext.<br>
<CFINPUT NAME="sext1" size=4 maxlength=10 message="Please enter an integer for the seller's Ext." validate="integer">
<input type="hidden" name="sext1_integer" value="Please enter an integer for the seller's Ext.">
</FONT>
</TD>
</TR>


<TR bgcolor="#a2a3fe">
<TD width=""><FONT FACE=ARIAL SIZE=2>
<INPUT NAME="slastname2" size=10 maxlength=15 VALUE=""></FONT>
</TD>

<TD width=""><FONT FACE=ARIAL SIZE=2>
<INPUT NAME="sfirstname2" size=6 maxlength=15 VALUE=""></FONT>
</TD>

<TD width=""><FONT FACE=ARIAL SIZE=2>
<INPUT NAME="sminame2" size=1 maxlength=15 VALUE=""></FONT>
</TD>

<TD width=""><FONT FACE=ARIAL SIZE=2>
<CFINPUT NAME="sssn2" message="Please enter the seller's social security no. in the format of xxx-xx-xxxx."  validate="social_security_number" size=10 maxlength=15> </FONT>
</TD>

<TD width=""><FONT FACE=ARIAL SIZE=2>
<CFINPUT NAME="shphone2" message="Please enter the seller's home phone no. in the format of xxx-xxx-xxxx." validate="telephone" size=10 maxlength=20> </FONT>
</TD>

<TD width=""><FONT FACE=ARIAL SIZE=2>
<CFINPUT NAME="swphone2" message="Please enter the seller's work phone no. in the format of xxx-xxx-xxxx." validate="telephone" size=10 maxlength=20>
</FONT>
</TD>

<TD width=""><FONT FACE=ARIAL SIZE=2>
<CFINPUT NAME="sext2" size=4 maxlength=10 message="Please enter an integer for the seller's Ext." validate="integer">
<input type="hidden" name="sext2_integer" value="Please enter an integer for the seller's Ext."></FONT>
</TD>
</TR>
</table>



<!--- Property Addresses--->


<TABLE BORDER=1 CELLSPACING=0 width=520 bgcolor="#a2a3fe">


<TR BGCOLOR="blue">
<TD ALIGN=middle colspan=2>
<FONT FACE=ARIAL SIZE=2 color="white">
<B>P R O P E R T Y  &nbsp; A D D R E S S </B></FONT>
</TD></TR>

<TR>
<TD bgcolor="#a2a3fe" WIDTH=150 align=right>
<FONT FACE=ARIAL SIZE=2 color="black">Street Address:</FONT>
</td>
<td>
<CFINPUT NAME="paddress" size=40 maxlength=50 message="Property Address is required." required="yes">
<input type="hidden" name="paddress_required" value="Property Address is required.">
</td>
</tr>

<tr>
<td bgcolor="#a2a3fe" width="" align=right><FONT FACE=ARIAL SIZE=2 color="black">
City, State, Zip:</td>
<td>
<CFINPUT NAME="pcity" size=19 maxlength=25 message="Property city is required." required="yes">
<input type="hidden" name="pcity_required" value="Property city is required.">,

<select name="pstate">
<cfoutput query="getstate">
<option value="#state#">#state#
</cfoutput>
</select>
<input type="hidden" name="pstate_required" value="Property state is required.">

<CFINPUT NAME="pzip" size=10 maxlength=10 message="Property zip is required." required="yes">
<input type="hidden" name="pzip_required" value="Property zip is required.">
</td>
</tr>

<TR>
<TD bgcolor="#a2a3fe" WIDTH=150 align=right>
<FONT FACE=ARIAL SIZE=2 color="black" >County:</FONT>
</td>
<td><INPUT NAME="pcounty" size=40 maxlength=50>

</td>
</tr>

<!--- Delete per request: Steve Papermaster 5/16/2000
<TR>
<TD bgcolor="#a2a3fe" WIDTH=150 align=right>
<FONT FACE=ARIAL SIZE=2 color="black">Searched Before:</FONT>
</td>
<td><select name="psearchbefore">
<option value="U">Unknown
<option value="Y">Yes
<option value="N">No
</select>
</td>
</tr>
--->


<tr>
<TD bgcolor="#a2a3fe" WIDTH=150 align=right>
<FONT FACE=ARIAL SIZE=2 color="black" >Legal Description:</FONT>
</td>
<td><input type="text" name="plegaldesc" size=50 maxlength=150>

</td>
</tr>

</table>


<TABLE BORDER=1 CELLSPACING=0 width=520 bgcolor="#a2a3fe">


<TR BGCOLOR="blue">
<TD ALIGN=middle colspan=2>
<FONT FACE=ARIAL SIZE=2 color="white">
<B>C O M M E N T S </B></FONT>
</TD></TR>

<TR>
<TD bgcolor="#a2a3fe" COLSPAN=2 align=center>
<TEXTAREA NAME="COMMENT" rows=4 cols=55 wrap="virtual"></textarea></td>
</tr>

</table>



<!--- BEGIN <CFIF> --->

<cfif #choice# is "prop">
<!-- Property Report -->
<A NAME=PROP></A>
<cfinclude template = "./prop.cfm">
<input type="hidden" name="choice" value="prop">
<!---<IMG alt="" border=0 height=10 src="images/clear.gif" width=500>--->


<cfelse>
<!-- Title Commitment -->
<A NAME=TITLE></A>
<cfinclude template = "./title.cfm">
<input type="hidden" name="choice" value="title">
<!---<IMG alt="" border=0 height=10 src="images/clear.gif" width=500>--->
</CFIF>




<!-- E-MAIL VERIFICATION -->

<A NAME=BOTTOM></A>

<TABLE BORDER=1 CELLPADDING=1 WIDTH=520 CELLSPACING=0 BGCOLOR=#a2a3fe>
<TR BGCOLOR="blue"><TD ALIGN=middle><FONT FACE=ARIAL SIZE=3 color="white"><B>Verify Order was Received</B></FONT></TD></TR>
<TR><TD WIDTH=520 ALIGN=middle><FONT FACE=ARIAL SIZE=2>Your E-Mail Address:</FONT><INPUT NAME="Verifyemail" SIZE=40 MAXLENGTH=40></TD></TR>
<TR><TD WIDTH=520 ALIGN=middle><FONT SIZE=-1>You will receive an e-mail when the order is received by us.</FONT></TD></TR>
</TABLE>

<!---<IMG alt="" border=0 height=10 src="images/clear.gif" width=440>--->


<p>
<TABLE BORDER=1 CELLPADDING=1 WIDTH=520 CELLSPACING=0 BGCOLOR=#a2a3fe>

<TR><TD WIDTH=520 ALIGN=middle><FONT SIZE=-1>You may also have verification sent to up to two other e-mail addresses.</FONT></TD></TR>

<TR><TD WIDTH=520 ALIGN=middle><FONT FACE=ARIAL SIZE=2>Other E-Mail:</FONT><INPUT NAME="Verifyemail_2" VALUE="" SIZE=40 MAXLENGTH=40></TD></TR>
<TR><TD WIDTH=520 ALIGN=middle><FONT FACE=ARIAL SIZE=2>Other E-Mail:</FONT><INPUT NAME="Verifyemail_3" VALUE=""  SIZE=40 MAXLENGTH=40></TD></TR>

</TABLE>



<!-- REPORT Is Going to Email to the following address-->

<A NAME=BOTTOM></A>

<TABLE BORDER=1 CELLPADDING=1 WIDTH=520 CELLSPACING=0 BGCOLOR=#a2a3fe>
<TR BGCOLOR="blue"><TD ALIGN=middle><FONT FACE=ARIAL SIZE=3 color="white"><B>Receive the Report by E-Mail</B></FONT></TD></TR>
<TR><TD WIDTH=520 ALIGN=middle><FONT FACE=ARIAL SIZE=2>Your E-Mail Address:</FONT><INPUT NAME="RptbyEmail" SIZE=40 MAXLENGTH=40></TD></TR>
<TR><TD WIDTH=520 ALIGN=middle><FONT SIZE=-1>Fill in your e-mail address to receive the report in <A HREF="https://www.adobe.com/prodindex/acrobat/readstep.html">Adobe Acrobat</A>
                                format.</FONT></TD></TR>
</TABLE><HR>

<CENTER>
<FONT FACE=ARIAL SIZE=2>IMPORTANT! Only Click Submit Once.<BR>Double clicking causes duplicate orders.</FONT><BR>


<cfoutput>
<input type="hidden" name="loginid" value="#loginid#">
<input type="hidden" name="acct_num" value="#acct_num#">
<input type="hidden" name="password" value="#password#">
</cfoutput>


<INPUT NAME="Submit" TYPE="submit" VALUE="Submit Order"> <INPUT TYPE="reset" VALUE="Clear Form"><BR>
</CENTER>
<HR>
</CFFORM>


<table border=0 align=center>
<FORM METHOD="POST" ACTION="./account_menu.cfm">


<cfoutput>
<input type="hidden" name="acct_num" value="#acct_num#">
<input type="hidden" name="password" value="#password#">
</cfoutput>


<TR ALIGN=CENTER><TD><input type="submit"  value="Back to Menu"></TD></TR>
</FORM>

</TABLE>

<HR>



</CENTER>
</TD></TR></TABLE>
</td></tr></table></NOBR>

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
