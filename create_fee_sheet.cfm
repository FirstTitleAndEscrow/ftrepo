<cffunction name="FixDecimals" >
	<cfargument name="input_num">
	<cfif IsNumeric(arguments.input_num) and arguments.input_num neq 0>
		<cfset new_num = NumberFormat(arguments.input_num, "_,___,___,___.__")>
	<cfelse>
		<cfset new_num = "">
	</cfif>
	<cfif arguments.input_num eq 0>
		<cfset new_num = "">
	</cfif>
	<cfreturn new_num>
</cffunction>

<cfparam name="url.rec_id" type="integer" default="0">
<cfparam name="url.rec_id" type="integer" default="#url.rec_id#">

<CFQUERY datasource="#request.dsn#" NAME="get_title_data">
	SELECT title_id, loan_number, paddress, pcounty, pcity, pstate, pzip, comp_id, share_loan_payoff, searchtype, realec_transactionID
	FROM title
	WHERE Title_ID = #url.rec_id#
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_title">
	SELECT *
	FROM title
	WHERE Title_ID = #url.rec_id#
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_comp">
	SELECT *
	from companies
	WHERE ID = #get_title_data.comp_id#
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="get_hud_data">
	SELECT *
	FROM HUD2010_TITLE_DATA
	WHERE Title_ID = #url.rec_id#
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="get_hud_data_b">
	SELECT *
	FROM HUD2010_TITLE_DATA_B
	WHERE Title_ID = #url.rec_id#
</CFQUERY>

		<cftry>
		<cfinvoke component = "cfc.team_info"	method = "getTeamEmail"	returnVariable = "team_email" team_id="#read_comp.team_id#">
		<cfcatch type="Any">
		<cfoutput>
		<cfmail from="rjermain@firsttitleservices.com" to="rjermain@firsttitleservices.com" subject="Team Email Failure">
		<hr>
			<h1>Other Error: #cfcatch.Type#</h1>
			<ul>
				<li><b>Message:</b> #cfcatch.Message#
				<li><b>Detail:</b> #cfcatch.Detail#
				<li><B>Page:</B> #GetBaseTemplatePath()#
			</ul>
		</cfmail>
        </cfoutput>
	</cfcatch>
</cftry>



</center>

<cfdocument format="PDF" pagetype="custom" pageheight="11" pagewidth="8.5" margintop=".25" marginbottom=".25" marginleft=".25" marginright=".25" filename="c:\uploads\FEE_SHEET_#read_title.title_id#.pdf" overwrite="yes">



<cfoutput>
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>Fee Sheet</title>
<style type="text/css">
<!--
body { margin:0px;padding:0px;font-family:arial,sans-serif;font-size:10px;}
table { font-size:9px; }
td { padding: 1px;  height: 11px; font-size: 12px;}
img { margin-bottom: 5px ;}
p.pagebreak { page-break-before:always }
.loantype { border:1px solid black; }
.page_container { width: 670px; }
.page_title { font-size:20px; }
.table_header { font-weight:bold; background-color:black; color:white; }
.bsilver { border-right:1px solid black; border-left:1px solid black; border-bottom:1px solid black;  background-color:##dddddd; }
.bdarksilver { border:1px solid black; background-color:##bbbbbb; }
.bdarksilver_head { border:1px solid black; font-weight:bold; background-color:##bbbbbb; }
.black { font-weight:bold; background-color:black; color:white; }
.bordered { border-bottom:1px solid black; border-right:1px solid black; text-align:right; vertical-align:bottom;  }
.bordered_wleft { border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; text-align:right; vertical-align:bottom;  }
.fourthpage { border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; text-align:left; vertical-align:top;  }
.fourthpageright { border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; text-align:right; vertical-align:top;  }
.fourthpagecenter { border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; text-align:center; vertical-align:top;  }
.fourthpagenoright { border-bottom:1px solid black; border-left:1px solid black; border-right:0px solid black; text-align:right; vertical-align:top;  }
.fourthpagenoleft { border-bottom:1px solid black; border-left:0px solid black; border-right:1px solid black; text-align:left; vertical-align:top;  }
.entry { color: blue; height: 11px; }
-->
</style>
	</head>
	<body>

	</cfoutput>

<table summary="" align="center" border="0" cellpadding="1" cellspacing="1" width="99%">

<cfoutput>
<tr><td align="left">
<cfif #read_comp.id# eq "729" or #read_comp.id# eq "100">

#UCase(session.site.long_name)#<BR>
<cfif NOT DateDiff("d", Now(), "1/30/2012")>
30 West Gude Drive, 4th Floor<BR>
Rockville, MD 20850<BR>
<cfelse>
7361 Calhoun Place, Suite 200<BR>
Rockville, MD 20855<BR>
</cfif>

<CFELSE>

To: #read_comp.company#<br>
From: #session.site.short_name#<br>
</cfif>
Borrower: #read_title.bfirstname1# #read_title.blastname1#<br>
Order Number: #read_title.title_id#<br>
Loan Amount: #read_title.loanamt_float#<br><br>
</td>
</tr></cfoutput>
</table>

<table summary="" align="center" border="0" cellpadding="1" cellspacing="1" width="99%">
<tr>
<td align="center" class="page_container">


<cfoutput>
<table width=600>
<tr><td height="4" colspan="3" align="center"><strong>#UCase(get_title_data.searchtype)#</strong></td></tr>
<tr>
<td colspan="3" class="bdarksilver_head">1100. Title Charges</td>
</tr>
<cfif Len(get_hud_data.A_1101_BORROWER_TITLESERVICES)>
<tr>
<td class="bsilver">1101. Title services and lender's title insurance</td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1101_BORROWER_TITLESERVICES, "___,___.00")#</span></td>
</tr>
</cfif>
<cfif Len(get_hud_data.A_1102_BORROWER_CLOSINGFEE) or Len(get_hud_data.A_1102_OUTSIDE_CLOSINGFEE)>
<tr>
<td class="bsilver">1102. Settlement or closing fee
to <span class="entry">#get_hud_data.A_1102_CLOSINGFEEPAYTO#</span>
$<span class="entry">#FixDecimals(get_hud_data.A_1102_OUTSIDE_CLOSINGFEE, "___,___.00")#</span></td>
<cfif Len(get_hud_data.A_1102_BORROWER_CLOSINGFEE)>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1102_BORROWER_CLOSINGFEE, "___,___.00")#</span></td>
</cfif>
</tr>
</cfif>
<cfif Len(get_hud_data.A_1103_OUTSIDE_OWNERSTITLEINS) or Len(get_hud_data.A_1103_BORROWER_OWNERSTITLEINS)>
<tr>
<td class="bsilver">1103. Owner's title insurance
to <span class="entry">#get_hud_data.A_1103_OWNERSTITLEINSPAYTO#</span>
$<span class="entry">#get_hud_data.A_1103_OUTSIDE_OWNERSTITLEINS#</span></td>
<cfif Len(get_hud_data.A_1103_BORROWER_OWNERSTITLEINS)>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1103_BORROWER_OWNERSTITLEINS, "___,___.00")#</span></td>
</cfif>
</tr>
</cfif>
<cfif Len(get_hud_data.A_1104_OUTSIDE_LENDERSTITLEINS) or Len(get_hud_data.A_1104_BORROWER_LENDERSTITLEINS)>
<tr>
<td class="bsilver">1104. Lender's title insurance
to <span class="entry">#get_hud_data.A_1104_LENDERSTITLEINSPAYTO#</span>
$<span class="entry">#FixDecimals(get_hud_data.A_1104_OUTSIDE_LENDERSTITLEINS, "___,___.00")#</span> </td>
<cfif Len(get_hud_data.A_1104_BORROWER_LENDERSTITLEINS)>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1104_BORROWER_LENDERSTITLEINS, "___,___.00")#</span></td>
</cfif>
</tr>
</cfif>

<cfif Len(get_hud_data.A_1105_LENDERSTITLEPOLICYLIMIT)>
 <tr>
<td class="bsilver">1105. Lender's title policy limit
$<span class="entry">#FixDecimals(get_hud_data.A_1105_LENDERSTITLEPOLICYLIMIT, "___,___.00")#</span> </td>
</tr>
</cfif>
<cfif Len(get_hud_data.A_1106_OWNERSTITLEPOLICYLIMIT)>
<tr>
<td class="bsilver">1106. Owner's title policy limit
$<span class="entry">#FixDecimals(get_hud_data.A_1106_OWNERSTITLEPOLICYLIMIT, "___,___.00")#</span> </td>
</tr>
</cfif>
<!--- <tr>
<td class="bsilver">1107. Agent's portion of the total title insurance premium
$<span class="entry">#FixDecimals(get_hud_data.A_1107_AGENTPREMIUMPORTION, "___,___.00")#</span> </td>
<td class="bordered">&nbsp; </td>
</tr>
<tr>
<td class="bsilver">1108. Underwriter's portion of the total title insurance premium
$<span class="entry">#FixDecimals(get_hud_data.A_1108_UNDERWRITERPREMIUMPORTION, "___,___.00")#</span> </td>
<td class="bordered">&nbsp; </td>
</tr> --->
<cfif Len(get_hud_data.A_1109_OUTSIDE_USERAMOUNT) or Len(get_hud_data.A_1109_BORROWER_USERAMOUNT)>
<tr>
<td class="bsilver">1109. <span class="entry">#get_hud_data.A_1109_USERDESC#</span>
to <span class="entry">#get_hud_data.A_1109_USERPAYTO#</span>
$<span class="entry">#FixDecimals(get_hud_data.A_1109_OUTSIDE_USERAMOUNT, "___,___.00")#</span> </td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1109_BORROWER_USERAMOUNT, "___,___.00")#</span></td>
</tr>
</cfif>
<cfif Len(get_hud_data.A_1110_OUTSIDE_USERAMOUNT) or Len(get_hud_data.A_1110_BORROWER_USERAMOUNT)>
<tr>
<td class="bsilver">1110. <span class="entry">#get_hud_data.A_1110_USERDESC#</span>
to <span class="entry">#get_hud_data.A_1110_USERPAYTO#</span>
$<span class="entry">#FixDecimals(get_hud_data.A_1110_OUTSIDE_USERAMOUNT, "___,___.00")#</span> </td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1110_BORROWER_USERAMOUNT, "___,___.00")#</span></td>
</tr>
</cfif>
<cfif Len(get_hud_data.A_1111_OUTSIDE_USERAMOUNT) or Len(get_hud_data.A_1111_BORROWER_USERAMOUNT)>
<tr>
<td class="bsilver">1111. <span class="entry">#get_hud_data.A_1111_USERDESC#</span>
to <span class="entry">#get_hud_data.A_1111_USERPAYTO#</span>
$<span class="entry">#FixDecimals(get_hud_data.A_1111_OUTSIDE_USERAMOUNT, "___,___.00")#</span> </td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1111_BORROWER_USERAMOUNT, "___,___.00")#</span></td>
</tr>
</cfif>
<cfif Len(get_hud_data.A_1112_OUTSIDE_USERAMOUNT) or Len(get_hud_data.A_1112_BORROWER_USERAMOUNT)>
<tr>
<td class="bsilver">1112. <span class="entry">#get_hud_data.A_1112_USERDESC#</span>
to <span class="entry">#get_hud_data.A_1112_USERPAYTO#</span>
$<span class="entry">#FixDecimals(get_hud_data.A_1112_OUTSIDE_USERAMOUNT, "___,___.00")#</span> </td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1112_BORROWER_USERAMOUNT, "___,___.00")#</span></td>
</tr>
</cfif>
<cfif Len(get_hud_data.A_1112_OUTSIDE_USERAMOUNT) or Len(get_hud_data.A_1112_BORROWER_USERAMOUNT)>
<tr>
<td class="bsilver">1113. <span class="entry">#get_hud_data.A_1113_USERDESC#</span>
to <span class="entry">#get_hud_data.A_1113_USERPAYTO#</span>
$<span class="entry">#FixDecimals(get_hud_data.A_1113_OUTSIDE_USERAMOUNT, "___,___.00")#</span> </td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1113_BORROWER_USERAMOUNT, "___,___.00")#</span></td>
</tr>
</cfif>
<cfif Len(get_hud_data.A_1114_OUTSIDE_USERAMOUNT) or Len(get_hud_data.A_1114_BORROWER_USERAMOUNT)>
<tr>
<td class="bsilver">1114. <span class="entry">#get_hud_data.A_1114_USERDESC#</span>
to <span class="entry">#get_hud_data.A_1114_USERPAYTO#</span>
$<span class="entry">#FixDecimals(get_hud_data.A_1114_OUTSIDE_USERAMOUNT, "___,___.00")#</span> </td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1114_BORROWER_USERAMOUNT, "___,___.00")#</span></td>
</tr>
</cfif>
<cfif Len(get_hud_data.A_1115_OUTSIDE_USERAMOUNT) or Len(get_hud_data.A_1115_BORROWER_USERAMOUNT)>
<tr>
<td class="bsilver">1115. <span class="entry">#get_hud_data.A_1115_USERDESC#</span>
to <span class="entry">#get_hud_data.A_1115_USERPAYTO#</span>
$<span class="entry">#FixDecimals(get_hud_data.A_1115_OUTSIDE_USERAMOUNT, "___,___.00")#</span> </td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1115_BORROWER_USERAMOUNT, "___,___.00")#</span></td>
</tr>
</cfif>
<cfif Len(get_hud_data.A_1116_OUTSIDE_USERAMOUNT) or Len(get_hud_data.A_1116_BORROWER_USERAMOUNT)>
<tr>
<td class="bsilver">1116. <span class="entry">#get_hud_data.A_1116_USERDESC#</span>
to <span class="entry">#get_hud_data.A_1116_USERPAYTO#</span>
$<span class="entry">#FixDecimals(get_hud_data.A_1116_OUTSIDE_USERAMOUNT, "___,___.00")#</span> </td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1116_BORROWER_USERAMOUNT, "___,___.00")#</span></td>
</tr>
</cfif>
<cfif Len(get_hud_data.A_1117_OUTSIDE_USERAMOUNT) or Len(get_hud_data.A_1117_BORROWER_USERAMOUNT)>
<tr>
<td class="bsilver">1117. <span class="entry">#get_hud_data.A_1117_USERDESC#</span>
to <span class="entry">#get_hud_data.A_1117_USERPAYTO#</span>
$<span class="entry">#FixDecimals(get_hud_data.A_1117_OUTSIDE_USERAMOUNT, "___,___.00")#</span> </td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1117_BORROWER_USERAMOUNT, "___,___.00")#</span></td>
</tr>
</cfif>
<cfif Len(get_hud_data.A_1118_OUTSIDE_USERAMOUNT) or Len(get_hud_data.A_1118_BORROWER_USERAMOUNT)>
<tr>
<td class="bsilver">1118. <span class="entry">#get_hud_data.A_1118_USERDESC#</span>
to <span class="entry">#get_hud_data.A_1118_USERPAYTO#</span>
$<span class="entry">#FixDecimals(get_hud_data.A_1118_OUTSIDE_USERAMOUNT, "___,___.00")#</span> </td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1118_BORROWER_USERAMOUNT, "___,___.00")#</span></td>
</tr>
</cfif>
<cfif Len(get_hud_data.A_1119_OUTSIDE_USERAMOUNT) or Len(get_hud_data.A_1119_BORROWER_USERAMOUNT)>
<tr>
<td class="bsilver">1119. <span class="entry">#get_hud_data.A_1119_USERDESC#</span>
to <span class="entry">#get_hud_data.A_1119_USERPAYTO#</span>
$<span class="entry">#FixDecimals(get_hud_data.A_1119_OUTSIDE_USERAMOUNT, "___,___.00")#</span> </td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1119_BORROWER_USERAMOUNT, "___,___.00")#</span></td>
</tr>
</cfif>
<cfif Len(get_hud_data.A_1120_OUTSIDE_USERAMOUNT) or Len(get_hud_data.A_1120_BORROWER_USERAMOUNT)>
<tr>
<td class="bsilver">1120. <span class="entry">#get_hud_data.A_1120_USERDESC#</span>
to <span class="entry">#get_hud_data.A_1120_USERPAYTO#</span>
$<span class="entry">#FixDecimals(get_hud_data.A_1120_OUTSIDE_USERAMOUNT, "___,___.00")#</span> </td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1120_BORROWER_USERAMOUNT, "___,___.00")#</span></td>
</tr>
</cfif>
<cfif Len(get_hud_data.A_1121_OUTSIDE_USERAMOUNT) or Len(get_hud_data.A_1121_BORROWER_USERAMOUNT)>
<tr>
<td class="bsilver">1121. <span class="entry">#get_hud_data.A_1121_USERDESC#</span>
to <span class="entry">#get_hud_data.A_1121_USERPAYTO#</span>
$<span class="entry">#FixDecimals(get_hud_data.A_1121_OUTSIDE_USERAMOUNT, "___,___.00")#</span> </td>
<cfif Len(get_hud_data.A_1121_BORROWER_USERAMOUNT)>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1121_BORROWER_USERAMOUNT, "___,___.00")#</span></td>
</cfif>
</tr>
</cfif>
<cfif Len(get_hud_data.A_1122_OUTSIDE_USERAMOUNT) or Len(get_hud_data.A_1122_BORROWER_USERAMOUNT)>
<tr>
<td class="bsilver">1122. <span class="entry">#get_hud_data.A_1122_USERDESC#</span>
to <span class="entry">#get_hud_data.A_1122_USERPAYTO#</span>
$<span class="entry">#FixDecimals(get_hud_data.A_1122_OUTSIDE_USERAMOUNT, "___,___.00")#</span> </td>
<cfif Len(get_hud_data.A_1122_BORROWER_USERAMOUNT)>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1122_BORROWER_USERAMOUNT, "___,___.00")#</span></td>
</cfif>
</tr>
</cfif>
<cfif Len(read_title.realec_transactionID)>
<tr>
	<td align="left" class="bsilver" valign="top"></td>
	<td align="right" class="bordered" valign="top"><span class="entry"></span></td>
	</tr>
	<tr>
	<td align="left" class="bsilver" valign="top"></td>
	<td align="right" class="bordered" valign="top"><span class="entry"></span></td>
	</tr>
</cfif>
<tr><td height="4" colspan="3"></td></tr>
<tr>
<td colspan="3" class="bdarksilver_head">Amounts Included in Line 1101</td>
</tr>
<cfif Len(get_hud_data_b.A_1101_ITEM_AMOUNT_01) and Len(get_hud_data_b.A_1101_ITEM_DESCRIPTION_01)>
<tr>
<td align="left" class="bsilver" valign="top">a. #get_hud_data_b.A_1101_ITEM_DESCRIPTION_01#</td>
<td align="right" class="bordered" valign="top"><span class="entry">#FixDecimals(get_hud_data_b.A_1101_ITEM_AMOUNT_01, "___,___.00")#</span></td>
</tr>
</cfif>
<cfif Len(get_hud_data_b.A_1101_ITEM_AMOUNT_02) and Len(get_hud_data_b.A_1101_ITEM_DESCRIPTION_02)>
<tr>
<td align="left" class="bsilver" valign="top" 2>b. #get_hud_data_b.A_1101_ITEM_DESCRIPTION_02#</td>
<td align="right" class="bordered" valign="top"><span class="entry">#FixDecimals(get_hud_data_b.A_1101_ITEM_AMOUNT_02, "___,___.00")#</span></td>
</tr>
</cfif>
<cfif Len(get_hud_data_b.A_1101_ITEM_AMOUNT_03) and Len(get_hud_data_b.A_1101_ITEM_DESCRIPTION_03)>
<tr>
<td align="left" class="bsilver" valign="top" >c. #get_hud_data_b.A_1101_ITEM_DESCRIPTION_03#</td>
<td align="right" class="bordered" valign="top"><span class="entry">#FixDecimals(get_hud_data_b.A_1101_ITEM_AMOUNT_03, "___,___.00")#</span></td>
</tr>
</cfif>
<cfif Len(get_hud_data_b.A_1101_ITEM_AMOUNT_04) and Len(get_hud_data_b.A_1101_ITEM_DESCRIPTION_04)>
<tr>
<td align="left" class="bsilver" valign="top" >d. #get_hud_data_b.A_1101_ITEM_DESCRIPTION_04#</td>
<td align="right" class="bordered" valign="top"><span class="entry">#FixDecimals(get_hud_data_b.A_1101_ITEM_AMOUNT_04, "___,___.00")#</span></td>
</tr>
</cfif>
<cfif Len(get_hud_data_b.A_1101_ITEM_AMOUNT_05) and Len(get_hud_data_b.A_1101_ITEM_DESCRIPTION_05)>
<tr>
<td align="left" class="bsilver" valign="top" >e. #get_hud_data_b.A_1101_ITEM_DESCRIPTION_05#</td>
<td align="right" class="bordered" valign="top"><span class="entry">#FixDecimals(get_hud_data_b.A_1101_ITEM_AMOUNT_05, "___,___.00")#</span></td>
</tr>
</cfif>
<cfif Len(get_hud_data_b.A_1101_ITEM_AMOUNT_06) and Len(get_hud_data_b.A_1101_ITEM_DESCRIPTION_06)>
<tr>
<td align="left" class="bsilver" valign="top">f. #get_hud_data_b.A_1101_ITEM_DESCRIPTION_06#</td>
<td align="right" class="bordered" valign="top"><span class="entry">#FixDecimals(get_hud_data_b.A_1101_ITEM_AMOUNT_06, "___,___.00")#</span></td>
</tr>
</cfif>
<cfif Len(get_hud_data_b.A_1101_ITEM_AMOUNT_07) and Len(get_hud_data_b.A_1101_ITEM_DESCRIPTION_07)>
<tr>
<td align="left" class="bsilver" valign="top" >g. #get_hud_data_b.A_1101_ITEM_DESCRIPTION_07#</td>
<td align="right" class="bordered" valign="top"><span class="entry">#FixDecimals(get_hud_data_b.A_1101_ITEM_AMOUNT_07, "___,___.00")#</span></td>
</tr>
</cfif>
<cfif Len(get_hud_data_b.A_1101_ITEM_AMOUNT_08) and Len(get_hud_data_b.A_1101_ITEM_DESCRIPTION_08)>
<tr>
<td align="left" class="bsilver" valign="top" >h. #get_hud_data_b.A_1101_ITEM_DESCRIPTION_08#</td>
<td align="right" class="bordered" valign="top"><span class="entry">#FixDecimals(get_hud_data_b.A_1101_ITEM_AMOUNT_08, "___,___.00")#</span></td>
</tr>
</cfif>
<cfif Len(get_hud_data_b.A_1101_ITEM_AMOUNT_09) and Len(get_hud_data_b.A_1101_ITEM_DESCRIPTION_09)>
<tr>
<td align="left" class="bsilver" valign="top">i. #get_hud_data_b.A_1101_ITEM_DESCRIPTION_09#</td>
<td align="right" class="bordered" valign="top"><span class="entry">#FixDecimals(get_hud_data_b.A_1101_ITEM_AMOUNT_09, "___,___.00")#</span></td>
</tr>
</cfif>
<cfif Len(get_hud_data_b.A_1101_ITEM_AMOUNT_10) and Len(get_hud_data_b.A_1101_ITEM_DESCRIPTION_10)>
<tr>
<td align="left" class="bsilver" valign="top" >j. #get_hud_data_b.A_1101_ITEM_DESCRIPTION_10#</td>
<td align="right" class="bordered" valign="top"><span class="entry">#FixDecimals(get_hud_data_b.A_1101_ITEM_AMOUNT_10, "___,___.00")#</span></td>
</tr>
</cfif>
<cfif Len(get_hud_data_b.A_1101_ITEM_AMOUNT_11) and Len(get_hud_data_b.A_1101_ITEM_DESCRIPTION_11)>
<tr>
<td align="left" class="bsilver" valign="top">k. #get_hud_data_b.A_1101_ITEM_DESCRIPTION_11#</td>
<td align="right" class="bordered" valign="top"><span class="entry">#FixDecimals(get_hud_data_b.A_1101_ITEM_AMOUNT_11, "___,___.00")#</span></td>
</tr>
</cfif>
<cfif Len(get_hud_data_b.A_1101_ITEM_AMOUNT_12) and Len(get_hud_data_b.A_1101_ITEM_DESCRIPTION_12)>
<tr>
<td align="left" class="bsilver" valign="top" >l. #get_hud_data_b.A_1101_ITEM_DESCRIPTION_12#</td>
<td align="right" class="bordered" valign="top"><span class="entry">#FixDecimals(get_hud_data_b.A_1101_ITEM_AMOUNT_12, "___,___.00")#</span></td>
</tr>
</cfif>
<cfif Len(get_hud_data_b.A_1101_ITEM_AMOUNT_13) and Len(get_hud_data_b.A_1101_ITEM_DESCRIPTION_13)>
<tr>
<td align="left" class="bsilver" valign="top">m. #get_hud_data_b.A_1101_ITEM_DESCRIPTION_13#</td>
<td align="right" class="bordered" valign="top"><span class="entry">#FixDecimals(get_hud_data_b.A_1101_ITEM_AMOUNT_13, "___,___.00")#</span></td>
</tr>
</cfif>
<cfif Len(get_hud_data_b.A_1101_ITEM_AMOUNT_14) and Len(get_hud_data_b.A_1101_ITEM_DESCRIPTION_14)>
<tr>
<td align="left" class="bsilver" valign="top">n. #get_hud_data_b.A_1101_ITEM_DESCRIPTION_14#</td>
<td align="right" class="bordered" valign="top"><span class="entry">#FixDecimals(get_hud_data_b.A_1101_ITEM_AMOUNT_14, "___,___.00")#</span></td>
</tr>
</cfif>
<cfif Len(get_hud_data_b.A_1101_ITEM_AMOUNT_15) and Len(get_hud_data_b.A_1101_ITEM_DESCRIPTION_15)>
<tr>
<td align="left" class="bsilver" valign="top">o. #get_hud_data_b.A_1101_ITEM_DESCRIPTION_15#</td>
<td align="right" class="bordered" valign="top"><span class="entry">#FixDecimals(get_hud_data_b.A_1101_ITEM_AMOUNT_15, "___,___.00")#</span></td>
</tr>
</cfif>
<cfif Len(get_hud_data_b.A_1101_ITEM_AMOUNT_16) and Len(get_hud_data_b.A_1101_ITEM_DESCRIPTION_16)>
<tr>
<td align="left" class="bsilver" valign="top">p. #get_hud_data_b.A_1101_ITEM_DESCRIPTION_16#</td>
<td align="right" class="bordered" valign="top"><span class="entry">#FixDecimals(get_hud_data_b.A_1101_ITEM_AMOUNT_16, "___,___.00")#</span></td>
</tr>
</cfif>
<cfif Len(get_hud_data_b.A_1101_ITEM_AMOUNT_17) and Len(get_hud_data_b.A_1101_ITEM_DESCRIPTION_17)>
<tr>
<td align="left" class="bsilver" valign="top">q. #get_hud_data_b.A_1101_ITEM_DESCRIPTION_17#</td>
<td align="right" class="bordered" valign="top"><span class="entry">#FixDecimals(get_hud_data_b.A_1101_ITEM_AMOUNT_17, "___,___.00")#</span></td>
</tr>
</cfif>
<cfif Len(get_hud_data_b.A_1101_ITEM_AMOUNT_18) and Len(get_hud_data_b.A_1101_ITEM_DESCRIPTION_18)>
<tr>
<td align="left" class="bsilver" valign="top" >r. #get_hud_data_b.A_1101_ITEM_DESCRIPTION_18#</td>
<td align="right" class="bordered" valign="top"><span class="entry">#FixDecimals(get_hud_data_b.A_1101_ITEM_AMOUNT_18, "___,___.00")#</span></td>
</tr>
</cfif>
<cfif Len(get_hud_data_b.A_1101_ITEM_AMOUNT_19) and Len(get_hud_data_b.A_1101_ITEM_DESCRIPTION_19)>
<tr>
<td align="left" class="bsilver" valign="top">s. #get_hud_data_b.A_1101_ITEM_DESCRIPTION_19#</td>
<td align="right" class="bordered" valign="top"><span class="entry">#FixDecimals(get_hud_data_b.A_1101_ITEM_AMOUNT_19, "___,___.00")#</span></td>
</tr>
</cfif>
<cfif Len(get_hud_data_b.A_1101_ITEM_AMOUNT_20) and Len(get_hud_data_b.A_1101_ITEM_DESCRIPTION_20)>
<tr>
<td align="left" class="bsilver" valign="top">t. #get_hud_data_b.A_1101_ITEM_DESCRIPTION_20#</td>
<td align="right" class="bordered" valign="top"><span class="entry">#FixDecimals(get_hud_data_b.A_1101_ITEM_AMOUNT_20, "___,___.00")#</span></td>
</tr>
</cfif>


<!-- 1200 -->

<tr><td height="4" colspan="3"></td></tr>
<tr>
<td colspan="3" class="bdarksilver_head">1200. Government Recording and Transfer Charges</td>
</tr>
<cfif Len(get_hud_data_b.A_1201_BORROWER_GOVTRECORDINGCHARGES)>
<tr>
<td class="bsilver">1201. Government recording charges</td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data_b.A_1201_BORROWER_GOVTRECORDINGCHARGES, "___,___.00")#</span></td>
</tr>
</cfif>
<cfif Len(get_hud_data_b.A_1202_DEED) or  Len(get_hud_data_b.A_1202_DEEDMORTGAGE) or  Len(get_hud_data_b.A_1202_DEEDRELEASES) or  Len(get_hud_data_b.A_1202_BORROWER_DEED)>
<tr>
<td class="bsilver">1202.
Deed $<span class="entry">#FixDecimals(get_hud_data_b.A_1202_DEED, "___,___.00")#</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Mortgage $<span class="entry">#FixDecimals(get_hud_data_b.A_1202_DEEDMORTGAGE, "___,___.00")#</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Releases $<span class="entry">#FixDecimals(get_hud_data_b.A_1202_DEEDRELEASES, "___,___.00")#</span></td>
<cfif Len(get_hud_data_b.A_1202_BORROWER_DEED)>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data_b.A_1202_BORROWER_DEED, "___,___.00")#</span></td>
</cfif>
</tr>
</cfif>
<cfif Len(get_hud_data_b.A_1203_BORROWER_TRANSFERTAXES) and get_hud_data_b.A_1203_BORROWER_TRANSFERTAXES gt 0>
<tr>
<td class="bsilver">1203. Transfer taxes</td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data_b.A_1203_BORROWER_TRANSFERTAXES, "___,___.00")#</span></td>
</tr>
</cfif>
<cfif Len(get_hud_data_b.A_1204_CITYCOUNTYTAXDEED) or Len(get_hud_data_b.A_1204_CITYCOUNTYTAXMORTGAGE) or Len(get_hud_data_b.A_1204_BORROWER_CITYCOUNTYTAX)>
<tr>
<td class="bsilver">1204. City/County tax/stamps &nbsp; &nbsp; &nbsp;
Deed $<span class="entry">#FixDecimals(get_hud_data_b.A_1204_CITYCOUNTYTAXDEED, "___,___.00")#</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Mortgage $<span class="entry">#FixDecimals(get_hud_data_b.A_1204_CITYCOUNTYTAXMORTGAGE, "___,___.00")#</span></td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data_b.A_1204_BORROWER_CITYCOUNTYTAX, "___,___.00")#</span></td>
</tr>
</cfif>
<cfif Len(get_hud_data_b.A_1205_STATETRANSTAXDEED) or Len(get_hud_data_b.A_1205_STATETRANSTAXMORTGAGE) or Len(get_hud_data_b.A_1205_BORROWER_STATETRANSTAX)>
<tr>
<td class="bsilver">1205. State tax/stamps &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Deed $<span class="entry">#FixDecimals(get_hud_data_b.A_1205_STATETRANSTAXDEED, "___,___.00")#</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Mortgage $<span class="entry">#FixDecimals(get_hud_data_b.A_1205_STATETRANSTAXMORTGAGE, "___,___.00")#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data_b.A_1205_BORROWER_STATETRANSTAX, "___,___.00")#</span></td>
</tr>
</cfif>
<cfif FixDecimals(get_hud_data_b.A_1206_BORROWER_USERAMOUNT, "___,___.00") gt 0>
<tr>
<td class="bsilver">1206. <span class="entry">#get_hud_data_b.A_1206_USERDESC#</span>
to <span class="entry">#get_hud_data_b.A_1206_USERPAYTO#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data_b.A_1206_BORROWER_USERAMOUNT, "___,___.00")#</span></td>
</tr>
</cfif>
<cfif FixDecimals(get_hud_data_b.A_1207_BORROWER_USERAMOUNT, "___,___.00") gt 0>
<tr>
<td class="bsilver">1207. <span class="entry">#get_hud_data_b.A_1207_USERDESC#</span>
to <span class="entry">#get_hud_data_b.A_1207_USERPAYTO#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data_b.A_1207_BORROWER_USERAMOUNT, "___,___.00")#</span></td>
</tr>
</cfif>
<!-- 1300 -->

<tr><td height="4" colspan="3"></td></tr>
<cfif FixDecimals(get_hud_data_b.A_1301_BORROWER_SERVICESYOUCANSHOPFOR, "___,___.00") gt 0>
<tr>
<td colspan="3" class="bdarksilver_head">1300. Additional Settlement Charges</td>
</tr>
<tr>
<td class="bsilver">1301. Required services that you can shop for</td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data_b.A_1301_BORROWER_SERVICESYOUCANSHOPFOR, "___,___.00")#</span></td>
</tr>
</cfif>
<cfif FixDecimals(get_hud_data_b.A_1302_OUTSIDE_USERAMOUNT, "___,___.00") gt 0 or FixDecimals(get_hud_data_b.A_1302_BORROWER_USERAMOUNT, "___,___.00") gt 0 >
<tr>
<td class="bsilver">1302. <span class="entry">#get_hud_data_b.A_1302_USERDESC#</span>
to <span class="entry">#get_hud_data_b.A_1302_USERPAYTO#</span>
$ <span class="entry">#FixDecimals(get_hud_data_b.A_1302_OUTSIDE_USERAMOUNT, "___,___.00")#</span> </td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data_b.A_1302_BORROWER_USERAMOUNT, "___,___.00")#</span></td>
</tr>
</cfif>
<cfif FixDecimals(get_hud_data_b.A_1303_OUTSIDE_USERAMOUNT, "___,___.00") gt 0 or FixDecimals(get_hud_data_b.A_1303_BORROWER_USERAMOUNT, "___,___.00") gt 0 >
<tr>
<td class="bsilver">1303. <span class="entry">#get_hud_data_b.A_1303_USERDESC#</span>
to <span class="entry">#get_hud_data_b.A_1303_USERPAYTO#</span>

$ <span class="entry">#FixDecimals(get_hud_data_b.A_1303_OUTSIDE_USERAMOUNT, "___,___.00")#</span> </td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data_b.A_1303_BORROWER_USERAMOUNT, "___,___.00")#</span></td>
</tr>
</cfif>
<cfif FixDecimals(get_hud_data_b.A_1304_OUTSIDE_USERAMOUNT, "___,___.00") gt 0 or FixDecimals(get_hud_data_b.A_1304_BORROWER_USERAMOUNT, "___,___.00") gt 0 >
<tr>
<td class="bsilver">1304. <span class="entry">#get_hud_data_b.A_1304_USERDESC#</span>
to <span class="entry">#get_hud_data_b.A_1304_USERPAYTO#</span>
$ <span class="entry">#FixDecimals(get_hud_data_b.A_1304_OUTSIDE_USERAMOUNT, "___,___.00")#</span> </td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data_b.A_1304_BORROWER_USERAMOUNT, "___,___.00")#</span></td>
</tr>
</cfif>
<cfif FixDecimals(get_hud_data_b.A_1305_OUTSIDE_USERAMOUNT, "___,___.00") gt 0 or FixDecimals(get_hud_data_b.A_1305_BORROWER_USERAMOUNT, "___,___.00") gt 0 >
<tr>
<td class="bsilver">1305. <span class="entry">#get_hud_data_b.A_1305_USERDESC#</span>
to <span class="entry">#get_hud_data_b.A_1305_USERPAYTO#</span>
$ <span class="entry">#FixDecimals(get_hud_data_b.A_1305_OUTSIDE_USERAMOUNT, "___,___.00")#</span> </td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data_b.A_1305_BORROWER_USERAMOUNT, "___,___.00")#</span></td>
</tr>
</cfif>
<cfif FixDecimals(get_hud_data_b.A_1306_OUTSIDE_USERAMOUNT, "___,___.00") gt 0 or FixDecimals(get_hud_data_b.A_1306_BORROWER_USERAMOUNT, "___,___.00") gt 0 >
<tr>
<td class="bsilver">1306. <span class="entry">#get_hud_data_b.A_1306_USERDESC#</span>
to <span class="entry">#get_hud_data_b.A_1306_USERPAYTO#</span>
$ <span class="entry">#FixDecimals(get_hud_data_b.A_1306_OUTSIDE_USERAMOUNT, "___,___.00")#</span> </td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data_b.A_1306_BORROWER_USERAMOUNT, "___,___.00")#</span></td>
</tr>
</cfif>
<cfif FixDecimals(get_hud_data_b.A_1307_OUTSIDE_USERAMOUNT, "___,___.00") gt 0 or FixDecimals(get_hud_data_b.A_1307_BORROWER_USERAMOUNT, "___,___.00") gt 0 >
<tr>
<td class="bsilver">1307. <span class="entry">#get_hud_data_b.A_1307_USERDESC#</span>
to <span class="entry">#get_hud_data_b.A_1307_USERPAYTO#</span>
$ <span class="entry">#FixDecimals(get_hud_data_b.A_1307_OUTSIDE_USERAMOUNT, "___,___.00")#</span> </td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data_b.A_1307_BORROWER_USERAMOUNT, "___,___.00")#</span></td>
</tr>
</cfif>
<cfif FixDecimals(get_hud_data_b.A_1308_OUTSIDE_USERAMOUNT, "___,___.00") gt 0 or FixDecimals(get_hud_data_b.A_1308_BORROWER_USERAMOUNT, "___,___.00") gt 0 >
<tr>
<td class="bsilver">1307. <span class="entry">#get_hud_data_b.A_1308_USERDESC#</span>
to <span class="entry">#get_hud_data_b.A_1308_USERPAYTO#</span>
$ <span class="entry">#FixDecimals(get_hud_data_b.A_1308_OUTSIDE_USERAMOUNT, "___,___.00")#</span> </td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data_b.A_1308_BORROWER_USERAMOUNT, "___,___.00")#</span></td>
</tr>
</cfif>



</table>
</cfoutput>


<cfif #read_comp.id# eq "729" or #read_comp.id# eq "100">
<table summary="" align="center" border="0" cellpadding="1" cellspacing="1" width="99%">
<tr>
<td align="left"><br><br>
Please forward all recording packages to the address below, and make payment of all clerk's charges to:<br><br></td>
</tr>
<tr>
<td  align="left">
Abstracts USA, LLC.<br>
<cfif NOT DateDiff("d", Now(), "1/30/2012")>
30 West Gude Drive<br>
4th Floor<br>
Rockville, MD 20850
<br><br>
<cfelse>
7361 Calhoun Place<br>
Suite 200<br>
Rockville, MD 20855
<br><br>
</cfif></td></tr><tr>
<td align="left">
Thank you.
<br><br>
</td>
</tr>
</table>
<CFELSE>
<table summary="" align="center" border="0" cellpadding="1" cellspacing="1" width="99%">
<tr>
<td align="left"><br><br>
These fees above do not include any charges for title endorsements unless indicated above.  Please contact your <cfoutput>#session.site.short_name#</cfoutput> representative for pricing.
</td>
</tr>
<tr>
<td align="left">
If the loan amount on this sheet differs from the current loan amount,
please call our office or email at <cfoutput>#team_email#</cfoutput>
to have a new fee sheet created.<br><br>
</td>
</tr>
</table>
</cfif>


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
</cfdocument>

