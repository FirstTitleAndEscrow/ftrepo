<cfoutput>
choice: #choice#<br>
</cfoutput>


<cfquery name="insertcustomers" DATASOURCE="First_Title_Services">
insert into customers (contactname, loanno, borrname, ssn, homephone, workphone, workext, address, city, state, zip, county, searchbefore, apprbefore, federal, over100K, comment, verifyemail, rptbyemail) values ('#contactname#', '#loanno#', '#borrname#', '#ssn#', '#homephone#', '#workphone#', '#workext#', '#address#', '#city#', '#state#', '#zip#', '#county#', '#searchbefore#', '#apprbefore#', '#federal#', '#over100K#', '#comment#', '#verifyemail#', '#rptbyemail#')
</cfquery>

<cfquery name="getcustid" DATASOURCE="First_Title_Services">
select max(customerid) as "custid" from customers
</cfquery>

<cfoutput>
<cfset  custid=#getcustid.custid#>
</cfoutput>

<cfoutput>
Custid: #custid#<br>
</cfoutput>

<cfoutput>
<cfset num=#ListLen(#choice#)#>
</cfoutput>

<cfset count=1>
<cfloop condition="#count# LT (#num#+1)">
<cfquery name="insertorders" DATASOURCE="First_Title_Services">
insert into  orders (servicetype, orderdate, customerid) values('#ListGetAt(choice, count)#', '#Dateformat(now())#',3 <!---'<cfoutput>#custid#</cfoutput>'--->)
<cfset count=#count#+1>
</cfquery>
</cfloop>

<cfif #ListFindNoCase(choice, "prop")# is not "0">
<cfquery name="insertprop" DATASOURCE="First_Title_Services">
insert into property_report (orderid, mortgage1,	mortgage2,flood,rpttype, book/page) values(12, 3, '#mortgage1#', '#mortgage2#', '#flood#', '#rpttype#', '#book/page#')
</cfquery>
</cfif>


<cfif #ListFindNoCase(choice, "title")# is not "0">
<cfquery name="inserttitle" DATASOURCE="First_Title_Services">
insert into property_report (orderid, insured,	aquired,	searchtype,	deedtransfer, loanamt,	namesigned,	closingdate) values(orderid, insured,	aquired,	searchtype,	deedtransfer, loanamt,	namesigned,	closingdate)
</cfquery>
</cfif>


<cfif #ListFindNoCase(choice, "closing")# is not "0">
<cfquery name="insertclosing" DATASOURCE="First_Title_Services">
insert into property_report (orderid, closingtype,	ordertype,	closingoption,	loantype) values(orderid	closingtype	ordertype	closingoption	loantype)
</cfquery>
</cfif>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<CFSET datnow = "#DateFormat(Now())#">
<CFSET timnow = "#TimeFormat(Now())#">
<html>
<head>
	<title>1st Title & Escrow, Inc. - Welcome</title>
</head>

<body leftmargin="0" topmargin="0" marginheight = "0" marginwidth = "0">
<table width=620 border="0" cellpadding="0" cellspacing="0"><tr><nobr><td colspan="2" valign=bottom><IMG height=1 src="./images/clear.gif" width=10><IMG src="./images/logo.gif"><b><font size=2 color=red face=arial><IMG height=1 src="./images/clear.gif" width=30><cfoutput> #datnow# - #timnow#</CFOUTPUT> (EST)</b></FONT></td></tr><tr><td colspan="2" valign="top"><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/bar.gif"></td></tr><tr><td width="145" valign="top"><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_01.gif"><br><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_02.gif"><br><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_03.gif"><br><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_04.gif"><br><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_05.gif"><br><IMG height=1 src="./images/clear.gif" width=20><A href="./customer_login.cfm"><IMG border=0 src="./images/nav_06.gif"></a><br><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_07.gif"><br><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_08.gif"><br><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_09.gif"><br><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_10.gif"><br><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_11.gif"><br></td><td>
<TABLE WIDTH=440 BORDER=0 CELLSPACING=0 align="center">
<TR>
<TD ALIGN=middle>
<FONT FACE=ARIAL COLOR="blue" SIZE=5>
<b>Thank you.</b></FONT><p>
<FONT FACE=ARIAL COLOR="blue" SIZE=4>
Your order has been received.</FONT>
<HR>
<CENTER></CENTER>
</TD></TR>
</TABLE>

</td></tr>
</table></NOBR>

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
