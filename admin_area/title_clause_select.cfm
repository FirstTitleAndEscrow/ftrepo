




<CFSET a_group_list = #ListToArray("Affirmative Coverage|Bankruptcy Matters|Cemeteries|Condo`s & PUD`s|Corporation|Dower|Deed|Driveways and Walkways|Easements|Encroachments|Estate|Fixture and Personal Property|Foreclosure Matters|Leases|Mechanic`s Liens|Mineral Rights|Miscellaneous|No liability|Open Judgments|Legal|Open Mortgages|Parties in Possession|Party Walls|Payoff Federal Tax Liens|Payoff Judgments|Payoff Mortgage/Deed of Trust|Restrictions|Streets and Alleys|Subject to the lease|Survey Matters|Taxes and Assessments|Unrecorded Interest|Water Rights", "|")#>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>
</head>

<BODY BGCOLOR="white" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>


<table width=600 cellpadding=1 cellpadding=1 border=0>
	<tr>
		<TD width=100 align=center valign=top>
			<font face=verdana size=1 color=black>
			Group
		</td>

		<TD width=100 align=center valign=top>
			<font face=verdana size=1 color=black>
			File Name
		</td>

		<TD width=400 align=center valign=top>
			<font face=verdana size=1 color=black>
			Contents
		</td>
	</tr>

<FORM METHOD=POST ACTION="./a_test3.cfm?a_modify=1&a_choice=ALL">

<CFSET bg_color = "e1e1e1">
<CFSET a_tracker = "1">

<CFLOOP FROM="1" TO="#arrayLen(a_comm_ID)#" INDEX="AAA">

<CFIF #AAA# GTE 151 AND #AAA# LTE 225>

<CFOUTPUT>
	<tr>
		<TD bgcolor="#bg_color#" width=100 align=center valign=top>
</CFOUTPUT>
				<SELECT NAME="a_group_name_2">
					
			<CFLOOP FROM="1" TO="#ArrayLen(a_group_list)#" INDEX="BBB">
				<CFOUTPUT>
					<CFIF #a_group_list[BBB]# EQ #a_comm_group_name[AAA]#>
						<OPTION VALUE="#a_comm_ID[AAA]#|#a_group_list[BBB]#" SELECTED>#a_group_list[BBB]#</OPTION>
					<CFELSE>
					<OPTION VALUE="#a_comm_ID[AAA]#|#a_group_list[BBB]#">#a_group_list[BBB]#</OPTION>
					</CFIF>
				</CFOUTPUT>
			</CFLOOP>			
					</SELECT>
		</td>
<CFOUTPUT>
		<TD bgcolor="#bg_color#" width=100 align=center valign=top>
			<font face=verdana size=1 color=black>
			#a_comm_name[AAA]#
		</td>

		<TD bgcolor="#bg_color#" width=400 align=left valign=top>
			<font face=verdana size=1 color=black>
			#a_comm_content[AAA]#
		</td>
	</tr>
<CFIF #a_tracker# EQ "1">
	<CFSET bg_color = "white">
	<CFSET a_tracker = "2">	

<CFELSE>
	<CFSET bg_color = "e1e1e1">
	<CFSET a_tracker = "1">	
</CFIF>

</CFOUTPUT>

</CFIF>
</CFLOOP>

	<tr>
		<TD  colspan=3 width=600 align=right valign=top>
			<font face=verdana size=1 color=black>
			<INPUT TYPE=submit value="modify">
			</FORM>
		</td>
	</tr>


</table>	
</BODY>
</HTML>
	
	
	