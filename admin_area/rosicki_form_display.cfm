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
<h3>TITLE COMMITMENT CHECKLIST</h3><br>
<cfoutput>
<input type="hidden" name="order_id" value="#rec_id#">

<table width="800" border="1" cellspacing="2" cellpadding="8">
  <tr>
    <td align="left" valign="top"><font face="Arial, Helvetica, sans-serif">
<center><strong>PRELIMINARY TITLE REPORT CHECKLIST</strong><br>
Updated 7-28-09</center><br><br>

<strong>Loan number:</strong>&nbsp;&nbsp;<cfif IsDefined("read_title.loan_number")>#read_title.loan_number#</cfif>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Property Address:</strong> #read_title.paddress#, #read_title.pcity#, #read_title.pstate# #read_title.pzip#<br><br>

<strong>Title vesting</strong> <br><br>

#read_rosicki.vesting#&nbsp;&nbsp;once f/c deed records.<br><br>

<strong>Delinquent Taxes</strong><br><br>

Amount&nbsp;&nbsp;#read_rosicki.del_taxes_amount#&nbsp;&nbsp;&nbsp;&nbsp;Years due&nbsp;&nbsp;#read_rosicki.del_taxes_years#<br><br>

Paid with f/c deed recording?&nbsp;&nbsp;<input type="radio" name="paid_fc" value="Y" size="15" <cfif read_rosicki.paid_fc eq 'Y'>checked</cfif>>&nbsp;Y&nbsp;&nbsp;&nbsp;<input type="radio" name="paid_fc" value="N" size="15" <cfif read_rosicki.paid_fc eq 'N'>checked</cfif>>&nbsp;N<br><br>

<strong>Delinquent HOA</strong> (Attach W-9 if over 1000.00)<br><br>

Amount&nbsp;&nbsp;#read_rosicki.del_hoa_amount#&nbsp;&nbsp;&nbsp;&nbsp;Years due &nbsp;&nbsp;#read_rosicki.del_hoa_years#<br><br>

<strong>IRS Lien</strong>	<br><br>

<input type="radio" name="irs_lien" value="Y" size="15" <cfif read_rosicki.irs_lien eq 'Y'>checked</cfif>>&nbsp;Y&nbsp;&nbsp;&nbsp;<input type="radio" name="irs_lien" value="N" size="15" <cfif read_rosicki.irs_lien eq 'N'>checked</cfif>>&nbsp;N&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Date Lien Expires #dateformat(read_rosicki.lien_expires, "m/d/yyyy")#<br><br>

<strong>Other Liens</strong>	(Attach W-9 for each lien noted)&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="other_liens" value="Y" size="15" <cfif read_rosicki.other_liens eq 'Y'>checked</cfif>>&nbsp;Y&nbsp;&nbsp;&nbsp;<input type="radio" name="other_liens" value="N" size="15" <cfif read_rosicki.other_liens eq 'N'>checked</cfif>>&nbsp;N<br><br>

To whom?&nbsp;&nbsp;#read_rosicki.to_whom1#&nbsp;&nbsp;&nbsp;&nbsp;Amount due&nbsp;&nbsp;#read_rosicki.to_whom1_amount#<br><br> 

To whom?&nbsp;&nbsp;#read_rosicki.to_whom2#&nbsp;&nbsp;&nbsp;&nbsp;Amount due&nbsp;&nbsp;#read_rosicki.to_whom2_amount#<br><br> 

To whom?&nbsp;&nbsp;#read_rosicki.to_whom3#&nbsp;&nbsp;&nbsp;&nbsp;Amount due&nbsp;&nbsp;#read_rosicki.to_whom3_amount#<br><br> 

<strong>Outstanding Mortgages/Judgments</strong>&nbsp;&nbsp;&nbsp;<input type="radio" name="outstanding_morts" value="Y" size="15" <cfif read_rosicki.outstanding_morts eq 'Y'>checked</cfif>>&nbsp;Y&nbsp;&nbsp;&nbsp;<input type="radio" name="outstanding_morts" value="N" size="15" <cfif read_rosicki.outstanding_morts eq 'N'>checked</cfif>>&nbsp;N<br><br>

<strong>Fall off with f/c deed recording?</strong>&nbsp;&nbsp;&nbsp;<input type="radio" name="falloff" value="Y" size="15" <cfif read_rosicki.falloff eq 'Y'>checked</cfif>>&nbsp;Y&nbsp;&nbsp;&nbsp;<input type="radio" name="falloff" value="N" size="15" <cfif read_rosicki.falloff eq 'N'>checked</cfif>>&nbsp;N<br><br>

If no, docs needed to clear (circle all required)<br><br>

<input type="checkbox" name="other_docs_needed" value="Origination Title policy" <cfif read_rosicki.other_docs_needed contains 'Origination Title policy'>checked</cfif>>&nbsp;Origination Title policy&nbsp;&nbsp;<input type="checkbox" name="other_docs_needed" value="Origination HUD" <cfif read_rosicki.other_docs_needed contains 'Origination HUD'>checked</cfif>>&nbsp;Origination HUD&nbsp;&nbsp;<input type="checkbox" name="other_docs_needed" value="Other docs needed" <cfif read_rosicki.other_docs_needed contains 'Other docs needed'>checked</cfif>>&nbsp;Other docs needed			#read_rosicki.other_docs_needed_text#<br><br>

<strong>Other issues</strong> (please indicate estimated timeframe to clear)<br>
#read_rosicki.other_issues#</font>
	</td>
  </tr>
</table>
</cfoutput>
<br>
<br></font>
</td>
</tr>
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