<body style="background-color: #FFFFFF; font-family:Arial, Helvetica, sans-serif; font-size:10px" >
<style type="text/css">
td {font-family:Arial, Helvetica, sans-serif; font-size:10px}
.big_header {font-family:Arial, Helvetica, sans-serif; font-size:20px}
.small_header {font-family:Arial, Helvetica, sans-serif; font-size:16px}

</style>
	<CFQUERY datasource="#request.dsn#" NAME="read_report">
			SELECT *
			FROM tax_cert_title
			where title_id = #rec_id#
		</CFQUERY>
	<CFQUERY datasource="#request.dsn#" NAME="read_title">
			SELECT *
			FROM title
			where title_id = #rec_id#
		</CFQUERY>
	<CFQUERY datasource="#request.dsn#" NAME="read_company">
			SELECT *
			FROM companies
			where id = #read_title.comp_id#
		</CFQUERY>



<table width="900" cellspacing=0 cellpadding=1 bgcolor="#000000">
<tr><td>
<table width="100%" cellpadding=5 cellspacing=1>
<tr bgcolor="FFFFFF">
<td align="center" valign="top">A</td>
<td align="center" valign="top">B</td>
<td align="center" valign="top">C</td>
<td align="center" valign="top">D</td>
<td align="center" valign="top">E</td>
<td align="center" valign="top">F</td>
<td align="center" valign="top">G</td>
<td align="center" valign="top">H</td>
<td align="center" valign="top">I</td>
<td align="center" valign="top">J</td>
</tr>
<tr bgcolor="FFFFFF">
<td align="center" valign="top">Name and Address<br>
of Taxing Authority</td>
<td align="center" valign="top">Collects for:</td>
<td align="center" valign="top">Parcel<br>
Identification</td>
<td align="center" valign="top">Timing of<br>
Payments</td>
<td align="center" valign="top">Due Date Each<br>
Installment</td>
<td align="center" valign="top">Delinquent<BR>
Date Each<br>

Installment</td>
<td align="center" valign="top">Last $
Amount<br>
Paid</td>
<td align="center" valign="top">Date Last<br>
Amt. Paid</td>
<td align="center" valign="top">Paid Through<br>
Date</td>
<td align="center" valign="top">Next Lender<br>
Payment Due Date</td>
</tr>
<cfoutput>
<tr bgcolor="FFFFFF">
<td align="left" valign="top" class="taxtext">#read_report.payto#<BR>
#read_report.taxcoll#<BR>
#read_report.add1#<cfif Len(read_report.add2)>, #read_report.add2#</cfif><BR>
#read_report.city#, #read_report.state# #read_report.zip#<BR>
#read_report.phone#<BR>
#read_report.web#</td>
<td align="left" valign="top" class="taxtext">#read_report.collects_for#</td>
<td align="left" valign="top" class="taxtext">#read_report.acctnum#</td>
<td align="left" valign="top" class="taxtext">#read_report.taxfreq#</td>
<td align="left" valign="top" class="taxtext">#read_report.tax_dueDate#
<cfif read_report.taxfreq eq 'Semi Annually'><br>
#read_report.tax_dueDateB#
</cfif>
<cfif read_report.taxfreq eq 'Quarterly'><br>
#read_report.tax_dueDateB#<br>
#read_report.tax_dueDateC#<br>
#read_report.tax_dueDateD#<br>
</cfif></td>
<td align="left" valign="top" class="taxtext">#read_report.tax_lateDate#
<cfif read_report.taxfreq eq 'Semi Annually'><br>
#read_report.tax_lateDateB#
</cfif>
<cfif read_report.taxfreq eq 'Quarterly'><br>
#read_report.tax_lateDateB#<br>
#read_report.tax_lateDateC#<br>
#read_report.tax_lateDateD#<br>
</cfif></td>
<td align="left" valign="top" class="taxtext">#read_report.lastamt#</td>
<td align="left" valign="top" class="taxtext">#read_report.paidDate#</td>
<td align="left" valign="top" class="taxtext">#read_report.paidTo#</td>
<td align="left" valign="top" class="taxtext">#read_report.dueDate#</td>
</tr>



<cfif Len(read_report.payto2)>
<tr bgcolor="FFFFFF">
<td align="left" valign="top">#read_report.payto2#<BR>
#read_report.taxcoll2#<BR>
#read_report.add12#<cfif Len(read_report.add22)>, #read_report.add22#</cfif><BR>
#read_report.city2#, #read_report.state2# #read_report.zip2#<BR>
#read_report.phone2#<BR>
#read_report.web2#</td>
<td align="left" valign="top">#read_report.collects_for2#</td>
<td align="left" valign="top">#read_report.acctnum2#</td>
<td align="left" valign="top">#read_report.taxfreq2#</td>
<td align="left" valign="top">#read_report.tax_dueDate2#
<cfif read_report.taxfreq2 eq 'Semi Annually'><br>
#read_report.tax_dueDate2B#
</cfif>
<cfif read_report.taxfreq2 eq 'Quarterly'><br>
#read_report.tax_dueDate2B#<br>
#read_report.tax_dueDate2C#<br>
#read_report.tax_dueDate2D#<br>
</cfif></td>
<td align="left" valign="top">#read_report.tax_lateDate2#
<cfif read_report.taxfreq2 eq 'Semi Annually'><br>
#read_report.tax_lateDate2B#
</cfif>
<cfif read_report.taxfreq2 eq 'Quarterly'><br>
#read_report.tax_lateDate2B#<br>
#read_report.tax_lateDate2C#<br>
#read_report.tax_lateDate2D#<br>
</cfif></td>
<td align="left" valign="top">#read_report.lastamt2#</td>
<td align="left" valign="top">#read_report.paidDate2#</td>
<td align="left" valign="top">#read_report.paidTo2#</td>
<td align="left" valign="top">#read_report.dueDate2#</td>
</tr>
</cfif>

<cfif Len(read_report.payto3)>
<tr bgcolor="FFFFFF">
<td align="left" valign="top">#read_report.payto3#<BR>
#read_report.taxcoll3#<BR>
#read_report.add13#<cfif Len(read_report.add23)>, #read_report.add23#</cfif><BR>
#read_report.city3#, #read_report.state# #read_report.zip3#<BR>
#read_report.phone3#<BR>
#read_report.web3#</td>
<td align="left" valign="top">#read_report.collects_for3#</td>
<td align="left" valign="top">#read_report.acctnum3#</td>
<td align="left" valign="top">#read_report.taxfreq3#</td>
<td align="left" valign="top">#read_report.tax_dueDate3#
<cfif read_report.taxfreq3 eq 'Semi Annually'><br>
#read_report.tax_dueDate3B#
</cfif>
<cfif read_report.taxfreq3 eq 'Quarterly'><br>
#read_report.tax_dueDate3B#<br>
#read_report.tax_dueDate3C#<br>
#read_report.tax_dueDate3D#<br>
</cfif></td>
<td align="left" valign="top">#read_report.tax_lateDate3#
<cfif read_report.taxfreq3 eq 'Semi Annually'><br>
#read_report.tax_lateDate3B#
</cfif>
<cfif read_report.taxfreq3 eq 'Quarterly'><br>
#read_report.tax_lateDate3B#<br>
#read_report.tax_lateDate3C#<br>
#read_report.tax_lateDate3D#<br>
</cfif></td>
<td align="left" valign="top">#read_report.lastamt3#</td>
<td align="left" valign="top">#read_report.paidDate3#</td>
<td align="left" valign="top">#read_report.paidTo3#</td>
<td align="left" valign="top">#read_report.dueDate3#</td>
</tr>
</cfif>

<cfif Len(read_report.payto4)>
<tr bgcolor="FFFFFF">
<td align="left" valign="top">#read_report.payto4#<BR>
#read_report.taxcoll4#<BR>
#read_report.add14#<cfif Len(read_report.add24)>, #read_report.add24#</cfif><BR>
#read_report.city4#, #read_report.state4# #read_report.zip4#<BR>
#read_report.phone4#<BR>
#read_report.web4#</td>
<td align="left" valign="top">#read_report.collects_for4#</td>
<td align="left" valign="top">#read_report.acctnum4#</td>
<td align="left" valign="top">#read_report.taxfreq4#</td>
<td align="left" valign="top">#read_report.tax_dueDate4#
<cfif read_report.taxfreq4 eq 'Semi Annually'><br>
#read_report.tax_dueDate4B#
</cfif>
<cfif read_report.taxfreq4 eq 'Quarterly'><br>
#read_report.tax_dueDate4B#<br>
#read_report.tax_dueDate4C#<br>
#read_report.tax_dueDate4D#<br>
</cfif></td>
<td align="left" valign="top">#read_report.tax_lateDate4#
<cfif read_report.taxfreq4 eq 'Semi Annually'><br>
#read_report.tax_lateDate4B#
</cfif>
<cfif read_report.taxfreq4 eq 'Quarterly'><br>
#read_report.tax_lateDate4B#<br>
#read_report.tax_lateDate4C#<br>
#read_report.tax_lateDate4D#<br>
</cfif></td>
<td align="left" valign="top">#read_report.lastamt4#</td>
<td align="left" valign="top">#read_report.paidDate4#</td>
<td align="left" valign="top">#read_report.paidTo4#</td>
<td align="left" valign="top">#read_report.dueDate4#</td>
</tr>
</cfif>



<cfif Len(read_report.payto5)>
<tr bgcolor="FFFFFF">
<td align="left" valign="top">#read_report.payto5#<BR>
#read_report.taxcoll5#<BR>
#read_report.add15#<cfif Len(read_report.add25)>, #read_report.add25#</cfif><BR>
#read_report.city5#, #read_report.state5# #read_report.zip5#<BR>
#read_report.phone5#<BR>
#read_report.web5#</td>
<td align="left" valign="top">#read_report.collects_for5#</td>
<td align="left" valign="top">#read_report.acctnum5#</td>
<td align="left" valign="top">#read_report.taxfreq5#</td>
<td align="left" valign="top">#read_report.tax_dueDate5#
<cfif read_report.taxfreq5 eq 'Semi Annually'><br>
#read_report.tax_dueDate5B#
</cfif>
<cfif read_report.taxfreq5 eq 'Quarterly'><br>
#read_report.tax_dueDate5B#<br>
#read_report.tax_dueDate5C#<br>
#read_report.tax_dueDate5D#<br>
</cfif></td>
<td align="left" valign="top">#read_report.tax_lateDate5#
<cfif read_report.taxfreq5 eq 'Semi Annually'><br>
#read_report.tax_lateDate5B#
</cfif>
<cfif read_report.taxfreq5 eq 'Quarterly'><br>
#read_report.tax_lateDate5B#<br>
#read_report.tax_lateDate5C#<br>
#read_report.tax_lateDate5D#<br>
</cfif></td>
<td align="left" valign="top">#read_report.lastamt5#</td>
<td align="left" valign="top">#read_report.paidDate5#</td>
<td align="left" valign="top">#read_report.paidTo5#</td>
<td align="left" valign="top">#read_report.dueDate5#</td>
</tr>
</cfif>


<cfif Len(read_report.payto6)>
<tr bgcolor="FFFFFF">
<td align="left" valign="top">#read_report.payto6#<BR>
#read_report.taxcoll6#<BR>
#read_report.add16#<cfif Len(read_report.add26)>, #read_report.add26#</cfif><BR>
#read_report.city6#, #read_report.state6# #read_report.zip6#<BR>
#read_report.phone6#<BR>
#read_report.web6#</td>
<td align="left" valign="top">#read_report.collects_for6#</td>
<td align="left" valign="top">#read_report.acctnum6#</td>
<td align="left" valign="top">#read_report.taxfreq6#</td>
<td align="left" valign="top">#read_report.tax_dueDate6#
<cfif read_report.taxfreq6 eq 'Semi Annually'><br>
#read_report.tax_dueDate6B#
</cfif>
<cfif read_report.taxfreq6 eq 'Quarterly'><br>
#read_report.tax_dueDate6B#<br>
#read_report.tax_dueDate6C#<br>
#read_report.tax_dueDate6D#<br>
</cfif></td>
<td align="left" valign="top">#read_report.tax_lateDate6#
<cfif read_report.taxfreq6 eq 'Semi Annually'><br>
#read_report.tax_lateDate6B#
</cfif>
<cfif read_report.taxfreq6 eq 'Quarterly'><br>
#read_report.tax_lateDate6B#<br>
#read_report.tax_lateDate6C#<br>
#read_report.tax_lateDate6D#<br>
</cfif></td>
<td align="left" valign="top">#read_report.lastamt6#</td>
<td align="left" valign="top">#read_report.paidDate6#</td>
<td align="left" valign="top">#read_report.paidTo6#</td>
<td align="left" valign="top">#read_report.dueDate6#</td>
</tr>
</cfif>



</cfoutput>

</table>
</td></tr></table> 
<br>
<table width="100%">
<tr>
<td align="left" valign="top" width="50%">Closing Agent/Attorney Name:<br>
<cfif read_company.streamline_client eq True>Streamline Title<cfelse>First Title & Escrow, Inc.</cfif></td>
<td align="left" valign="top" width="50%">
Address:<br>
7361 Calhoun Place, Suite 200<br>
Rockville, MD 20855<br>
<br>
Phone: 301-279-0303<br>
<!--- Initials: WC --->

</td>
</tr>
</table>





</body>