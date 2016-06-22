



<CFQUERY DATASOURCE="firsttitle_temp" NAME="read_data">

	SELECT DISTINCT oname
	FROM customers

</CFQUERY>

<CFSET a_count = "1">
<CFSET oname_1 = ArrayNew(1)>

<CFOUTPUT QUERY="read_data">

	<CFSET oname_1[a_count] = #oname#>
	<CFSET a_count = #a_count# + "1">
	
</CFOUTPUT>




<table width=640 cellpadding=1 cellspacing=1 border=0>
	<tr>
		<td width=50 align=center valign=top bgcolor="black">
			<font size=1 color=f1f1f1 face=arial>
			Customer ID
		</td>
		<td width=40 align=center valign=top bgcolor="black">
			<font size=1 color=f1f1f1 face=arial>
			Login ID
		</td>			
		<td width=110 align=center valign=top bgcolor="black">
			<font size=1 color=f1f1f1 face=arial>
			Officers Name
		</td>
		<td width=90 align=center valign=top bgcolor="black">
			<font size=1 color=f1f1f1 face=arial>
			Phone
		</td>
		<td width=30 align=center valign=top bgcolor="black">
			<font size=1 color=f1f1f1 face=arial>
			Ext
		</td>
		<td width=90 align=center valign=top bgcolor="black">
			<font size=1 color=f1f1f1 face=arial>
			Fax
		</td>		
		<td width=200 align=center valign=top bgcolor="black">
			<font size=1 color=f1f1f1 face=arial>
			emails
		</td>
	</tr>

<CFSET c_trigger = "1">
<CFSET bg_color = "e3e3e3">

<CFLOOP FROM="1" to="#ArrayLen(oname_1)#" INDEX="AAA">

<CFQUERY DATASOURCE="firsttitle_temp" NAME="read_data1">

	SELECT *
	FROM customers
	where oname = '#oname_1[AAA]#'

</CFQUERY>


<CFOUTPUT>

	<tr>
		<td width=50 align=center valign=top bgcolor="#bg_color#">
			<font size=1 color=black face=arial>
			#read_data1.CustomerID#
		</td>
		<td width=40 align=center valign=top bgcolor="#bg_color#">
			<font size=1 color=black face=arial>
			#read_data1.LoginID#
		</td>			
		<td width=110 align=center valign=top bgcolor="#bg_color#">
			<font size=1 color=black face=arial>
			#read_data1.OName#
		</td>
		<td width=90 align=center valign=top bgcolor="#bg_color#">
			<font size=1 color=black face=arial>
			#read_data1.oPhone#
		</td>
		<td width=30 align=center valign=top bgcolor="#bg_color#">
			<font size=1 color=black face=arial>
			#read_data1.oExt#
		</td>
		<td width=90 align=center valign=top bgcolor="#bg_color#">
			<font size=1 color=black face=arial>
			#read_data1.oFax#
		</td>		
		<td width=200 align=center valign=top bgcolor="#bg_color#">
			<font size=1 color=black face=arial>
			#read_data1.verifyemail#<br>
			#read_data1.rptbyemail#<br>
			#read_data1.verifyemail_2#<br>
			#read_data1.verifyemail_3#<br>
			
		</td>
	</tr>

<CFIF #c_trigger# EQ "1">

	<CFSET c_trigger = "2">
	<CFSET bg_color = "white">

<CFELSE>

	<CFSET c_trigger = "1">
	<CFSET bg_color = "e3e3e3">
</CFIF>

	
	
</CFOUTPUT>

</CFLOOP>

</table>

