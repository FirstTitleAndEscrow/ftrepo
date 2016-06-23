<CFPARAM NAME="a_trigger" DEFAULT="0">
<CFQUERY datasource="#request.dsn#" NAME="get_titleid">
			SELECT *
			FROM title
			WHERE Title_ID = #rec_id#
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="mods">
			SELECT *
			FROM closing_form_mods
			WHERE Title_ID = #rec_id#
</CFQUERY>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "https://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Untitled Document</title>
<style type="text/css">
<!--
body { margin:0px;padding:0px;font-family:arial,sans-serif;font-size:10px;}
table { font-size:10px;}
textarea { font-family:arial,sans-serif; font-size:12px; color:#004000; background:#cdfed0; border:1px dotted #004000; }
input.text, input.date, input.two_digit, input.four_digit { font-size:10px; font-style:italic; width:180px; color:#999999; background:#cdfed0; border:1px dotted #004000; }
input.textnormal, input.date, input.two_digit, input.four_digit { font-size:10px; font-style:normal; width:180px; color:#000000; background:#cdfed0; border:1px dotted #004000; }
input.small { font-size:10px; font-style:italic; width:100px; color:#999999;background:#cdfed0; border:1px dotted #004000; text-align:right; }
input.smallnormal { font-size:10px; width:100px; font-style:normal; color:#000000;background:#cdfed0; border:1px dotted #004000; text-align:right; }
input.check { font-size:10px; width:30px; color:#004000; border:1px dotted #004000; }
input.userout { font-size:10px; width:160px; color:#400000; background:#ffdfdf; border:1px dotted #400000; }
input.userin { font-size:10px; width:180px; color:#400000; background:#ffdfdf; border:1px dotted #400000; }
p.pagebreak { page-break-before:always }
.page_container { width:1330px; }
.page_title { font-size:14px; }
.table_header { font-weight:bold; background-color:black; color:white; }
.bsilver { border-right:1px solid black; border-left:1px solid black; border-bottom:1px solid black;  background-color:#dddddd; }
.bdarksilver { border:1px solid black; background-color:#bbbbbb; }
.bdarksilver_head { border:1px solid black; font-weight:bold; background-color:#bbbbbb; }
.black { font-weight:bold; background-color:black; color:white; }
.bordered { border-bottom:1px solid black; border-right:1px solid black; text-align:right; vertical-align:bottom;  }
.bordered_wleft { border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; text-align:right; vertical-align:bottom;  }
.plaintext { font-size:12px;  color:#000000; }

-->
</style>
</head>

<body>

<table width="800" border="0" cellpadding=0 cellspacing=0>
  <tr bgcolor=000000>
    <td align="left" valign="top"><table width="800" border="0" cellpadding=3 cellspacing=2>
  <tr bgcolor=000000>
    <td align="center" valign="top" colspan="2"><font color="WHITE" size=+1><strong>FANNIE MAE</strong><BR>
<strong>REO WIRE TRANSFER INSTRUCTIONS</strong><BR></font>
<font color="RED" size=+1><strong>FOR SALES PROCEEDS HUD1 USE ONLY</strong><BR></font></td>
  </tr>
  <tr bgcolor=ffffff>
    <td align="left" valign="top" colspan="2" class="plaintext"><font color="black"><strong>NOTE:</font> <font color="red">Please include all required information in the requested field format, failure to do so will delay the<BR>
processing of the remitted payment.</font></strong><br><br>
</td>
  </tr>
  <tr bgcolor=navy>
    <td align="left" valign="top" colspan="2">&nbsp;</td>
  </tr>
  <tr bgcolor=white>
    <td align="left" valign="top" colspan="2" class="plaintext">ACCOUNT INFORMATION<BR>
(No Bank Name or Address Required. ABA and Account Number are the same)</td>
  </tr>
  <tr bgcolor=white>
    <td align="left" valign="top" width="50%" class="plaintext">ACCOUNT NAME</td>
    <td align="left" valign="top" width="50%" class="plaintext">FNMA Federal Reserve Bank</td>
  </tr>
  <tr bgcolor=white>
    <td align="left" valign="top" width="50%" class="plaintext"><br>
ABA ROUTING NUMBER<br>
</td>
    <td align="left" valign="top" width="50%" class="plaintext"><br>
021039500<br>
<br>
</td>
  </tr>
   <tr bgcolor=navy>
    <td align="left" valign="top" colspan="2">&nbsp;</td>
  </tr>
  <tr bgcolor=white>
    <td align="left" valign="top" width="50%" class="plaintext"><strong>REQUIRED FEDWIRE FIELDS</strong><br>
<font color="red"><em>(Please be sure to provide data in the correct fields)</em></font></td>
    <td align="left" valign="top" width="50%" class="plaintext"><strong>REQUIRED INFORMATION</strong><br>
<font color="red"><em>(Please be sure to include all required information)</em></font></td>
  </tr>
  <tr bgcolor=white>
    <td align="left" valign="top" width="50%" class="plaintext">OBI row 1 - Originator to Beneficiary Information<BR>
(35 characters limitation)</td>
    <td align="left" valign="top" width="50%" class="plaintext"><BR>Category: GR420 (Very Important)<br>
Attn: REO Sales proceeds</td>
  </tr>
  <tr bgcolor=white>
    <td align="left" valign="top" width="50%" class="plaintext"><BR>OBI row 2 (35 characters limitation)<BR>
(35 characters limitation)</td>
    <td align="left" valign="top" width="50%" class="plaintext">FannieMae Loan Number (10 numeric digits- Required)<BR>
and REO Case Number <cfoutput><cfif get_titleid.recordcount and Len(get_titleid.loan_number)>#get_titleid.loan_number#</cfif></cfoutput></td>
  </tr>
  <tr bgcolor=white>
    <td align="left" valign="top" width="50%" class="plaintext"><BR>OBI row 3 (35 characters limitation)<BR>
(35 characters limitation)</td>
    <td align="left" valign="top" width="50%" class="plaintext"><BR>Receipt Code 310</td>
  </tr>
  <tr bgcolor=white>
    <td align="left" valign="top" width="50%" class="plaintext"><BR>OBI row 4 (35 characters limitation)<BR>
(35 characters limitation)</td>
    <td align="left" valign="top" width="50%" class="plaintext"><BR>Property Address: <cfoutput>#get_titleid.paddress#, #get_titleid.pcity#, #get_titleid.pstate# #get_titleid.pzip#</cfoutput></td>
  </tr>
  <tr bgcolor=white>
    <td align="left" valign="top" colspan="2" class="plaintext"><strong>RECEIPT CODE:</strong><BR><BR>
310 = Sales Proceeds HUD1<BR><BR>
317 = Taxes, Escrow<BR><BR>
322 = Reimbursement of Advance<BR><BR>
370 = Earnest Money<BR><BR></td>
  </tr>
  <tr bgcolor=navy>
    <td align="left" valign="top" colspan="2">&nbsp;</td>
  </tr>
  <tr bgcolor=white>
    <td align="left" valign="top" colspan="2">&nbsp;</td>
  </tr>
  <tr bgcolor=white>
    <td align="left" valign="top" colspan="2" class="plaintext"><strong>ADDITIONAL NOTE:<BR>
<font color="red">When sending multiple payments on a wire, you must email the payment detail breakdown. Failure to do<BR>
so will delay the processing of the remitted payment.<BR>
Email the detail to FannieMae_REO_Receipts@fanniemae.com</font></strong><br>
<br>
</td>
  </tr>
</table></td></tr></table>
</body>
</html>
