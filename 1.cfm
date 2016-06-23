

<cfquery name="getcustomerinfo" DATASOURCE="First_Title_Services">
SELECT * FROM customers WHERE customerid=#customerid# and <!---blastname1='#blastname1#' AND 
bfirstname1='#bfirstname1#' and---> pstate='#pstate#'
</cfquery>

<cfquery name="getstate" DATASOURCE="First_Title_Services">
SELECT state FROM taxtable ORDER BY state
</cfquery>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Untitled Test</title>
</head>

<body>

<cfoutput query="getcustomerinfo">
<TABLE BORDER=1 CELLSPACING=0 width=520 bgcolor="a2a3fe">
<FORM  ACTION="./order_verify.cfm" METHOD=POST method="post">

<TR BGCOLOR="blue">
<TD ALIGN=middle colspan=4>
<FONT FACE=ARIAL SIZE=2 color="white">
<B>A C C O U N T &nbsp; I N F O R M A T I O N</B></FONT>
</TD></TR>

<TR>
<TD bgcolor="a2a3fe" colspan=4>
<FONT FACE=ARIAL SIZE=2 color="black"><b>Loan Officer:</b></FONT>
</td></tr>


<tr>
<td bgcolor="a2a3fe" width=""><FONT FACE=ARIAL SIZE=2 color="black">
Name<br>
<INPUT NAME="oname" value="#oname#" size=15 maxlength=25>
</td>

<td bgcolor="a2a3fe" width=""><FONT FACE=ARIAL SIZE=2 color="black">
Phone No.<br>
<INPUT NAME="ophone" message="Please enter the office's phone no. in the format of xxx-xxx-xxxx." validate="telephone"  size=10 maxlength=15 value="#ophone#"> 
</td>


</tr>
</table>
</form>
</cfoutput>

</body>
</html>
