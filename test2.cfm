		<CFQUERY datasource="#request.dsn#" NAME="read_title">
			select distinct u.lp_email from companies c join users u on u.comp_id = c.id where lp_email like '%@%.%' and c.a_user <> '' and c.a_status = 1 and c.ID <> 115 and c.ID <> 621 and c.ID <> 108 order by u.lp_email
		</cfquery>


	<cfloop query="read_title">


			<CFQUERY datasource="#request.dsn#" NAME="read_title2">
			select comp_id,pname from users where lp_email = '#lp_email#'
		</cfquery>

	<CFQUERY datasource="#request.dsn#" NAME="read_comp">
			select a_user, a_pass from companies where id = #read_title2.comp_id#
		</cfquery>

<CFMAIL
				TO="#lp_email#"
				FROM="spape@firsttitleservices.com"
				SERVER="127.0.0.1"
				Subject="First Title Services.com Login Information"
				TIMEOUT="600"
				type="HTML"
				>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html;charset=iso-8859-1">
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=Content-Type content="text/html; charset=iso-8859-1">
<META content="MSHTML 6.00.2900.2523" name=GENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=ffffff>
<DIV><FONT face=Arial size=2><SPAN class=562595122-14012005><FONT face=Arial
color=0000ff size=2>&nbsp;
<P class=MsoNormal><SPAN style="FONT-SIZE: 10pt; FONT-FAMILY: Arial"><b><FONT
color=000000>Good&nbsp;Afternoon&nbsp;&nbsp;#read_title2.pname#:</FONT></b></SPAN></P>
<P><SPAN style="FONT-SIZE: 10pt; FONT-FAMILY: Arial"><FONT color=000000>Just
a&nbsp;<SPAN style="COLOR: black">F</SPAN>riendly&nbsp;<SPAN
style="COLOR: black">R</SPAN>eminder -- Your&nbsp;First Title
Services.Com&nbsp;Login info is as follows:<BR>LOGIN
NAME:&nbsp;&nbsp;&nbsp;#read_comp.a_user#&nbsp;
PASSWORD:&nbsp;&nbsp;&nbsp;#read_comp.a_pass#</FONT></SPAN></P>
<P><SPAN style="FONT-SIZE: 10pt; FONT-FAMILY: Arial"><FONT color=000000>You can
order&nbsp;title, closing and a variety of settlement services&nbsp;at any
time&nbsp;via access to our site at </FONT><A
href="https://#cgi.server_name#"><SPAN
style="COLOR: blue">#cgi.server_name#</SPAN></A><FONT
color=000000>&nbsp;</FONT></SPAN></P>
<P><SPAN style="FONT-SIZE: 10pt; FONT-FAMILY: Arial"><FONT
color=000000>Remember, with all title orders placed, you will receive our
exclusive "Instant HUD-1" just seconds after ordering.<SPAN>&nbsp; </SPAN>Our
"Instant HUD-1" delineates all&nbsp;title insurance, closing, and recordation
charges specific to your&nbsp;transaction ordered.&nbsp;&nbsp;<SPAN
class=187202421-17012005>&nbsp;At First Title, we provide you with
a&nbsp;</SPAN>single point of contact<SPAN class=187202421-17012005>,&nbsp;
24/7&nbsp;</SPAN>access<SPAN class=312242217-17012005>&nbsp;</SPAN><SPAN
class=187202421-17012005>to web system to view your loan files, as well
as&nbsp;title and closing related documents in your transaction (e.g. contracts,
surveys, title report, and payoff statements).&nbsp; Some of the exciting system
features&nbsp;include:&nbsp;&nbsp;</SPAN></FONT></SPAN></P>
<P><SPAN style="FONT-SIZE: 10pt; FONT-FAMILY: Arial"><SPAN
class=187202421-17012005><FONT color=000000>- Your own personalized web-based
Closing Calendar - you can either request a new closing or check the status of
your pending pipeline</FONT></SPAN></SPAN></P>
<P><SPAN style="FONT-SIZE: 10pt; FONT-FAMILY: Arial"><SPAN
class=187202421-17012005></SPAN></SPAN><SPAN
style="FONT-SIZE: 10pt; FONT-FAMILY: Arial"><SPAN class=187202421-17012005><FONT
color=000000>-&nbsp;"Endorsement Express" - make&nbsp;changes to your title
commitment on-the-fly.&nbsp; Change Loan Amount or Investor name in seconds and
print to your desktop</FONT></SPAN></SPAN></P>
<P><FONT color=000000><SPAN style="FONT-SIZE: 10pt; FONT-FAMILY: Arial"><SPAN
class=187202421-17012005>- Closing Cost Calculator - have exact Closing, Title
Insurance, and Recordation fees for your transaction in seconds.&nbsp; Type in
transaction type, state and county where&nbsp;</SPAN></SPAN><SPAN
style="FONT-SIZE: 10pt; FONT-FAMILY: Arial"><SPAN class=187202421-17012005>the
property is located, and your done! No more waiting for closing costs!
</SPAN></SPAN></FONT></P>
<P><SPAN style="FONT-SIZE: 10pt; FONT-FAMILY: Arial"><FONT color=000000><SPAN
class=187202421-17012005>I</SPAN>f you have any questions<SPAN
class=187202421-17012005>, would like to schedule a time for a short
web-training session&nbsp;on our system, or even&nbsp;</SPAN>place an order by
phone<SPAN class=187202421-17012005>&nbsp;,&nbsp;</SPAN>just give me a
call!</FONT></SPAN></P>
<P class=MsoNormal><SPAN style="FONT-SIZE: 10pt; FONT-FAMILY: Arial"><FONT
color=000000>Best Regards,&nbsp;<BR>&nbsp;</FONT></SPAN></P>
<P class=MsoNormal><SPAN style="FONT-SIZE: 10pt; FONT-FAMILY: Arial"><FONT
color=000000>J. Michael Cross</FONT></SPAN></P>
<P class=MsoNormal><SPAN style="FONT-SIZE: 10pt; FONT-FAMILY: Arial"><FONT
color=000000>First Title &amp; Escrow, Inc.&nbsp;&nbsp;</FONT></SPAN></P>
<P class=MsoNormal><SPAN style="FONT-SIZE: 10pt; FONT-FAMILY: Arial"><cfif NOT DateDiff("d", Now(), "1/30/2012")><FONT
color=000000>Senior &nbsp;Account Executive<BR>&nbsp;30 West Gude
Drive</FONT></SPAN></P>
<P class=MsoNormal><SPAN style="FONT-SIZE: 10pt; FONT-FAMILY: Arial"><FONT
color=000000>Rockville, MD 20850&nbsp;&nbsp;<BR>ph:&nbsp;301-279-0303
x330&nbsp; fax:&nbsp;&nbsp;301-279-7930&nbsp;<BR></FONT><cfelse><FONT
color=000000>Senior &nbsp;Account Executive<BR>&nbsp;7361 Calhoun Place, Suite 200,</FONT></SPAN></P>
<P class=MsoNormal><SPAN style="FONT-SIZE: 10pt; FONT-FAMILY: Arial"><FONT
color=000000>Rockville, MD 20855&nbsp;&nbsp;<BR>ph:&nbsp;301-279-0303
x330&nbsp; fax:&nbsp;&nbsp;301-279-7930&nbsp;<BR></FONT></cfif><SPAN
style="COLOR: blue"><A
href="https://by14fd.bay14.hotmail.msn.com/cgi-bin/compose?mailto=1&amp;msg=MSG1105998929.9&amp;start=7421606&amp;len=12695&amp;src=&amp;type=x&amp;to=mcross@firsttitleservices.com&amp;cc=&amp;bcc=&amp;subject=&amp;body=&amp;curmbox=F000000001&amp;a=dd6d5587c098d8ff262b4a99f7f122d7">mcross@firsttitleservices.com</A></SPAN><FONT
color=000000> </FONT></SPAN></P></FONT></SPAN></FONT></DIV><script type="text/javascript">



  var _gaq = _gaq || [];

  _gaq.push(['_setAccount', 'UA-195021-17']);

  _gaq.push(['_trackPageview']);



  (function() {

    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;

    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'https://www') + '.google-analytics.com/ga.js';

    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);

  })();



</script>

</body></HTML>
</cfmail>
</cfloop>

<CFQUERY datasource="#request.dsn#" NAME="read_officer">
select distinct u.lo_email from companies c join loan_officers u on u.comp_id = c.id where lo_email like '%@%.%' and c.a_user <> '' and c.a_status = 1 and c.ID <> 115 and c.ID <> 621 and c.id <> 108 and u.lo_email not in (
select distinct u.lp_email from companies c join users u on u.comp_id = c.id where lp_email like '%@%.%' and c.a_user <> '' and c.a_status = 1 and c.ID <> 115 and c.ID <> 621 and c.id <> 108 )
		</cfquery>

<cfloop query="read_officer">

<CFQUERY datasource="#request.dsn#" NAME="read_officer2">
			select comp_id,oname from loan_officers where lo_email = '#lo_email#'
		</cfquery>

	<CFQUERY datasource="#request.dsn#" NAME="read_comp2">
			select a_user, a_pass from companies where id = #read_officer2.comp_id#
		</cfquery>

<CFMAIL
				TO="#lo_email#"
				FROM="spape@firsttitleservices.com"
				SERVER="127.0.0.1"
				Subject="First Title Services.com Login Information"
				TIMEOUT="600"
				type="HTML"
				>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html;charset=iso-8859-1">
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=Content-Type content="text/html; charset=iso-8859-1">
<META content="MSHTML 6.00.2900.2523" name=GENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=ffffff>
<DIV><FONT face=Arial size=2><SPAN class=562595122-14012005><FONT face=Arial
color=0000ff size=2>&nbsp;
<P class=MsoNormal><SPAN style="FONT-SIZE: 10pt; FONT-FAMILY: Arial"><b><FONT
color=000000>Good&nbsp;Afternoon&nbsp;&nbsp;#read_officer2.oname#:</FONT></b></SPAN></P>
<P><SPAN style="FONT-SIZE: 10pt; FONT-FAMILY: Arial"><FONT color=000000>Just
a&nbsp;<SPAN style="COLOR: black">F</SPAN>riendly&nbsp;<SPAN
style="COLOR: black">R</SPAN>eminder -- Your&nbsp;First Title
Services.Com&nbsp;Login info is as follows:<BR>LOGIN
NAME:&nbsp;&nbsp;&nbsp;#read_comp2.a_user#&nbsp;
PASSWORD:&nbsp;&nbsp;&nbsp;#read_comp2.a_pass#</FONT></SPAN></P>
<P><SPAN style="FONT-SIZE: 10pt; FONT-FAMILY: Arial"><FONT color=000000>You can
order&nbsp;title, closing and a variety of settlement services&nbsp;at any
time&nbsp;via access to our site at </FONT><A
href="/"><SPAN
style="COLOR: blue">www.firsttitleservices.com</SPAN></A><FONT
color=000000>&nbsp;</FONT></SPAN></P>
<P><SPAN style="FONT-SIZE: 10pt; FONT-FAMILY: Arial"><FONT
color=000000>Remember, with all title orders placed, you will receive our
exclusive "Instant HUD-1" just seconds after ordering.<SPAN>&nbsp; </SPAN>Our
"Instant HUD-1" delineates all&nbsp;title insurance, closing, and recordation
charges specific to your&nbsp;transaction ordered.&nbsp;&nbsp;<SPAN
class=187202421-17012005>&nbsp;At First Title, we provide you with
a&nbsp;</SPAN>single point of contact<SPAN class=187202421-17012005>,&nbsp;
24/7&nbsp;</SPAN>access<SPAN class=312242217-17012005>&nbsp;</SPAN><SPAN
class=187202421-17012005>to web system to view your loan files, as well
as&nbsp;title and closing related documents in your transaction (e.g. contracts,
surveys, title report, and payoff statements).&nbsp; Some of the exciting system
features&nbsp;include:&nbsp;&nbsp;</SPAN></FONT></SPAN></P>
<P><SPAN style="FONT-SIZE: 10pt; FONT-FAMILY: Arial"><SPAN
class=187202421-17012005><FONT color=000000>- Your own personalized web-based
Closing Calendar - you can either request a new closing or check the status of
your pending pipeline</FONT></SPAN></SPAN></P>
<P><SPAN style="FONT-SIZE: 10pt; FONT-FAMILY: Arial"><SPAN
class=187202421-17012005></SPAN></SPAN><SPAN
style="FONT-SIZE: 10pt; FONT-FAMILY: Arial"><SPAN class=187202421-17012005><FONT
color=000000>-&nbsp;"Endorsement Express" - make&nbsp;changes to your title
commitment on-the-fly.&nbsp; Change Loan Amount or Investor name in seconds and
print to your desktop</FONT></SPAN></SPAN></P>
<P><FONT color=000000><SPAN style="FONT-SIZE: 10pt; FONT-FAMILY: Arial"><SPAN
class=187202421-17012005>- Closing Cost Calculator - have exact Closing, Title
Insurance, and Recordation fees for your transaction in seconds.&nbsp; Type in
transaction type, state and county where&nbsp;</SPAN></SPAN><SPAN
style="FONT-SIZE: 10pt; FONT-FAMILY: Arial"><SPAN class=187202421-17012005>the
property is located, and your done! No more waiting for closing costs!
</SPAN></SPAN></FONT></P>
<P><SPAN style="FONT-SIZE: 10pt; FONT-FAMILY: Arial"><FONT color=000000><SPAN
class=187202421-17012005>I</SPAN>f you have any questions<SPAN
class=187202421-17012005>, would like to schedule a time for a short
web-training session&nbsp;on our system, or even&nbsp;</SPAN>place an order by
phone<SPAN class=187202421-17012005>&nbsp;,&nbsp;</SPAN>just give me a
call!</FONT></SPAN></P>
<P class=MsoNormal><SPAN style="FONT-SIZE: 10pt; FONT-FAMILY: Arial"><FONT
color=000000>Best Regards,&nbsp;<BR>&nbsp;</FONT></SPAN></P>
<P class=MsoNormal><SPAN style="FONT-SIZE: 10pt; FONT-FAMILY: Arial"><FONT
color=000000>J. Michael Cross</FONT></SPAN></P>
<P class=MsoNormal><SPAN style="FONT-SIZE: 10pt; FONT-FAMILY: Arial"><FONT
color=000000>First Title &amp; Escrow, Inc.&nbsp;&nbsp;</FONT></SPAN></P>
<P class=MsoNormal><SPAN style="FONT-SIZE: 10pt; FONT-FAMILY: Arial"><cfif NOT DateDiff("d", Now(), "1/30/2012")><FONT
color=000000>Senior &nbsp;Account Executive<BR>&nbsp;30 West Gude
Drive</FONT></SPAN></P>
<P class=MsoNormal><SPAN style="FONT-SIZE: 10pt; FONT-FAMILY: Arial"><FONT
color=000000>Rockville, MD 20850&nbsp;&nbsp;<BR>ph:&nbsp;301-279-0303
x330&nbsp; fax:&nbsp;&nbsp;301-279-7930&nbsp;<BR></FONT><cfelse><FONT
color=000000>Senior &nbsp;Account Executive<BR>&nbsp;7361 Calhoun Place, Suite 200,</FONT></SPAN></P>
<P class=MsoNormal><SPAN style="FONT-SIZE: 10pt; FONT-FAMILY: Arial"><FONT
color=000000>Rockville, MD 20855&nbsp;&nbsp;<BR>ph:&nbsp;301-279-0303
x330&nbsp; fax:&nbsp;&nbsp;301-279-7930&nbsp;<BR></FONT></cfif><SPAN
style="COLOR: blue"><A
href="https://by14fd.bay14.hotmail.msn.com/cgi-bin/compose?mailto=1&amp;msg=MSG1105998929.9&amp;start=7421606&amp;len=12695&amp;src=&amp;type=x&amp;to=mcross@firsttitleservices.com&amp;cc=&amp;bcc=&amp;subject=&amp;body=&amp;curmbox=F000000001&amp;a=dd6d5587c098d8ff262b4a99f7f122d7">mcross@firsttitleservices.com</A></SPAN><FONT
color=000000> </FONT></SPAN></P></FONT></SPAN></FONT></DIV><script type="text/javascript">



  var _gaq = _gaq || [];

  _gaq.push(['_setAccount', 'UA-195021-17']);

  _gaq.push(['_trackPageview']);



  (function() {

    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;

    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'https://www') + '.google-analytics.com/ga.js';

    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);

  })();



</script>

</body></HTML>
</cfmail>





</cfloop>