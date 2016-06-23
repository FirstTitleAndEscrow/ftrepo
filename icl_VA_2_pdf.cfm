<p style="page-break-after:always;">&nbsp;</p> <IE:DEVICERECT ID="<CFOUTPUT><CFIF #read_Title.pstate# eq "CA" OR #read_Title.pstate# eq "NV">page8<CFELSE>Page7</CFIF></cfoutput>" CLASS="masterstyle" MEDIA="print">
	    <table width="100%" cellpadding=0 cellspacing=0 border=0 >

	    <tr>
		  <td colspan="2" align="center" valign="middle" bgcolor="000000" height="30"><B><font color="FFFFFF" size="4">&nbsp;</font></B></td>
	</tr>
	</table>
	   <table width="93%" cellpadding=0 cellspacing=0 border=0 >
	   <tr>
          <td width="33%">
         <cfoutput>   <!--- ===/ This is the Title_ID from the Title Table \=== --->
            <NOBR>Order Number: <B>#read_Title.Title_ID#</B></NOBR></td>
            <td align="Center"><!--- <NOBR>Stewart Title Guaranty Company</NOBR> --->&nbsp;</td>
          <td align="right"><NOBR>Commitment Number: D-#read_Title.Title_ID#</NOBR></td></cfoutput>
        </tr>
	   <tr>
          <td COLSPAN = 3><p>&nbsp;</p></td>
        </tr>
        <tr>
          <td colspan = 3 align = "left">


	<img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/stewart_icl.jpg"><BR>


<table width="90%" style="font-family:Arial, Helvetica, sans-serif; font-size:13px;">
<tr>
<td align="left" valign="top" width-"60%">&nbsp;</td>
<td align="left" valign="top" width-"40%">&nbsp;
</td>
</tr>

<tr>
<td align="left" valign="top" colspan="2">
&nbsp;&nbsp;&nbsp;B. If the Closing is to be conducted by an Approved Attorney, a title insurance binder or commitment for the
issuance of a policy of title insurance of the Company must have been issued prior to the transmission of your final
closing instructions to the Approved Attorney.
<br>
<br>
&nbsp;&nbsp;&nbsp;C. When the Company shall have reimbursed you pursuant to this letter, it shall be subrogated to all rights and
remedies which you would have had against any person or property had you not been so reimbursed. Liability of the
Company for such reimbursement shall be reduced to the extent that you have knowingly and voluntarily impaired the
value of such right of subrogation.
<br>
<br>
&nbsp;&nbsp;&nbsp;D. Any liability of the Company for loss incurred by you in connection with closings or real estate transactions by an
Issuing Agent or Approved Attorney shall be limited to the protection provided by this letter. However, this letter shall
not affect the protection afforded by a title insurance binder, commitment or policy of the Company.
<br>
<br>
&nbsp;&nbsp;&nbsp;E. Claims shall be made promptly to the Company at its principal office at 1980 Post Oak Blvd., Houston, Texas
77056. When the failure to give prompt notice shall prejudice the Company, then liability of the Company hereunder
shall be reduced to the extent of such prejudice.
<br>
<br>
&nbsp;&nbsp;&nbsp;The protection herein offered will continue until cancelled by written notice from the Company.
<br>
<br>
&nbsp;&nbsp;&nbsp;Any previous Insured Closing Service Letter or similar agreement for Virginia real estate transactions is hereby
cancelled except as to closings of your real estate transactions regarding which you have previously sent, or within 30
days hereafter send, written closing instructions to the Issuing Agent or Approved Attorney.
<br>
<br>
Stewart Title Guaranty Company

<BR><BR><BR><BR>

By: <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/stewart_icl_JG_sig.jpg"><BR>
James L Gosdin<BR>
Senior VP / Chief Underwriting & Associate General Counsel
<BR><BR><BR><BR>

<br>
081/ALTA/081-STATE OF VIRGINIA ICL
<BR><br>
<cfif NOT DateDiff("d", Now(), "1/30/2012")>
<div align="center">
30 West Gude Drive Suite # 450 * Rockville, MD 20850 * (301)279-0303 </div><BR><BR>
<BR><BR>
<cfelse>
<div align="center">
7361 Calhoun Place, Suite # 200 * Rockville, MD 20855 * (301)279-0303 </div><BR><BR>
<BR><BR>
</cfif>





		  </td>
        </tr>
        <tr>
          <td colspan="2">&nbsp;</td>
        </tr>
        <tr align="right" valign="top">
          <td COLSPAN = 2><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/stewart_logo.jpg"></td>
        </tr>
      </table>
	</IE:DEVICERECT>
