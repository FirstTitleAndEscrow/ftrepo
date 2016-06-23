<IE:DEVICERECT ID="<CFOUTPUT><CFIF #read_Title.pstate# eq "CA" OR #read_Title.pstate# eq "NV">page1<CFELSE>Page0</CFIF></cfoutput>" CLASS="masterstyle" MEDIA="print">
<STYLE TYPE="text/css">
P {page-break-after:always;}
TD {font:Arial, Helvetica, sans-serif;}
</style>
<!----1st page starts ----->
<!----------body table starts---------->
<!--- <table width=98% cellpadding=0 cellspacing=0 border=2 align="center" bordercolor="000000" bordercolordark="000000" bordercolorlight="000000">
<tr><td valign="top" align="center">	
====================================================================== --->
<!--- =================[ BEGIN SCHEDULE A         ]======================== --->
<!--- ====================================================================== --->
<table width="100%" cellpadding=0 cellspacing=0 border=0 >
        <tr>
		  <td colspan="2" align="center" valign="middle" bgcolor="000000" height="30"><B><font color="FFFFFF" size="4">&nbsp;</font></B></td>
	</tr>
</table>
<table width="93%" cellpadding=0 cellspacing=0 border=0 >
	<tr>
		<td width="33%"><!--- ===/ This is the Title_ID from the Title Table \=== --->
						<cfoutput><NOBR>Order Number: <B>#read_Title.Title_ID#</B></NOBR></td>
		<td align="Center">
            <NOBR>First American Title Insurance Company</NOBR>
         </td> 
    <td align="right"><NOBR>Commitment Number: D-#read_Title.Title_ID# </NOBR></td></cfoutput>
	</tr>
</table>
<table width="93%" cellpadding=0 cellspacing=0 border=0 >
    <tr>
          <td>
            <BR><BR>
          </td>  
    </tr>
    <tr>      
          <td width="100%" align=left valign=top><font color="gray">


<cfif read_title.comp_id eq 3182 or read_title.comp_id eq 2368 or ListContainsNoCase(children, read_title.comp_id, ",")>
<CFif read_rosicki.recordcount>
<table width="100%">
<tr>
<td colspan="3" align="center"><BR><h2>Streamline Title & Escrow Services, LLC</h2>
<h3>TITLE COMMITMENT CHECKLIST</h3>
for Property: <cfoutput>#read_title.paddress#, #read_title.pcity#, #read_title.pstate# #read_title.pzip#</cfoutput><br>
<br>

</td>
</tr>
<tr>
<td width="40%" bgcolor="#E1E1E1"><strong>Problem</strong></td>
<td width="30%" bgcolor="#E1E1E1"><strong>Comments</strong></td>
<td width="30%" bgcolor="#E1E1E1"><strong>Date Cleared</strong></td>
</tr>
<CFOUTPUT>
<tr>
<td><input type="checkbox" <cfif read_rosicki.problem1 eq 1>checked</cfif>> Title Vested in</td>
<td>#read_rosicki.problem1_comments#</td>
<td>#read_rosicki.problem1_date_cleared#</td>
</tr>
<tr bgcolor="##F7F7F7">
<td><input type="checkbox" <cfif read_rosicki.problem2 eq 1>checked</cfif>> Delinquent Taxes</td>
<td>#read_rosicki.problem2_comments#</td>
<td>#read_rosicki.problem2_date_cleared#</td>
</tr>
<tr>
<td><input type="checkbox" <cfif read_rosicki.problem3 eq 1>checked</cfif>> Delinquent HOA</td>
<td>#read_rosicki.problem3_comments#</td>
<td>#read_rosicki.problem3_date_cleared#</td>
</tr>
<tr bgcolor="##F7F7F7">
<td><input type="checkbox" <cfif read_rosicki.problem4 eq 1>checked</cfif>> Utility Lien</td>
<td>#read_rosicki.problem4_comments#</td>
<td>#read_rosicki.problem4_date_cleared#</td>
</tr>
<tr>
<td><input type="checkbox" <cfif read_rosicki.problem5 eq 1>checked</cfif>> Bankruptcy Filed</td>
<td>#read_rosicki.problem5_comments#</td>
<td>#read_rosicki.problem5_date_cleared#</td>
</tr>
<tr bgcolor="##F7F7F7">
<td><input type="checkbox" <cfif read_rosicki.problem6 eq 1>checked</cfif>> Outstanding Judgment</td>
<td>#read_rosicki.problem6_comments#</td>
<td>#read_rosicki.problem6_date_cleared#</td>
</tr>
<tr>
<td><input type="checkbox" <cfif read_rosicki.problem7 eq 1>checked</cfif>> IRS Liens</td>
<td>#read_rosicki.problem7_comments#</td>
<td>#read_rosicki.problem7_date_cleared#</td>
</tr>
<tr bgcolor="##F7F7F7">
<td><input type="checkbox" <cfif read_rosicki.problem8 eq 1>checked</cfif>> Outstanding Mortgage</td>
<td>#read_rosicki.problem8_comments#</td>
<td>#read_rosicki.problem8_date_cleared#</td>
</tr>
<tr>
<td><input type="checkbox" <cfif read_rosicki.problem9 eq 1>checked</cfif>> Invalid Foreclosure</td>
<td>#read_rosicki.problem9_comments#</td>
<td>#read_rosicki.problem9_date_cleared#</td>
</tr>
<tr bgcolor="##F7F7F7">
<td><input type="checkbox" <cfif read_rosicki.problem10 eq 1>checked</cfif>> Other Issues</td>
<td>#read_rosicki.problem10_comments#</td>
<td>#read_rosicki.problem10_date_cleared#</td>
</tr>

</CFOUTPUT>



</table>

</cfif>
</cfif>
          </td>  
        
    </tr>
</table>
<!--- ====================================================================== --->
<!--- =================[ END OF SCHEDULE A         ]======================== --->
<!--- ====================================================================== --->
</IE:DEVICERECT><P>