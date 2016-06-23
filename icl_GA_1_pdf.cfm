<p style="page-break-after:always;">&nbsp;</p>
<IE:DEVICERECT ID="<CFOUTPUT><CFIF #read_Title.pstate# eq "CA" OR #read_Title.pstate# eq "NV">page7<CFELSE>Page6</CFIF></cfoutput>" CLASS="masterstyle" MEDIA="print">
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



<CFQUERY datasource="#request.dsn#" NAME="get_email_date">
	SELECT * FROM Title_Notes where order_id = #rec_ID# and N_note like 'Title Commitment Delivered%'
	</CFQUERY>

<table width="90%" style="font-family:Arial, Helvetica, sans-serif; font-size:13px;">
<tr>
<td align="left" valign="top" width-"60%"><cfoutput>#DateFormat(Now(), "long")#</cfoutput></td>
<td align="left" valign="top" width-"40%">James L. Gosdin<BR>
Chief    Underwriting    Counsel    /<BR>
Senior Vice President<BR>
Stewart Title Guaranty-Home Office<BR>
1980 Post Oak Blvd., Suite 710<BR>
Houston, TX 77056<BR>
</td>
</tr>

<tr>
<td align="left" valign="top" colspan="2">

<cfoutput>#read_FT_Company.icl_address#
<BR>
Attn: Loan Number #read_title.loan_number#<BR>
<br>
</cfoutput>



Re: Closing Protection Letter/Insured Closing Letter<BR>
&nbsp;&nbsp;&nbsp;&nbsp;Issuing Agency File Number T-<cfoutput>#read_title.title_id#</cfoutput><BR>
&nbsp;&nbsp;&nbsp;&nbsp;Buyer/Borrower: <cfoutput>
	<cfif read_title.company1 neq '' and read_title.company1 neq 'NULL'>#read_title.company1#
	<cfelse>
		<cfif read_title.bfirstname1 neq '' and read_title.bfirstname1 neq 'NULL'>#read_title.bfirstname1#
		</cfif>
		<cfif read_title.bminame1 neq '' and read_title.bminame1 neq 'NULL'>#read_title.bminame1#.
		</cfif>
		<cfif read_title.blastname1 neq '' and read_title.blastname1 neq 'NULL'>#read_title.blastname1#
		</cfif>
		<cfif read_title.bfirstname2 neq '' and read_title.bfirstname2 neq 'NULL'> and #read_title.bfirstname2#
		</cfif>
		<cfif read_title.bminame2 neq '' and read_title.bminame2 neq 'NULL'>#read_title.bminame2#.
		</cfif>
		<cfif read_title.blastname2 neq '' and read_title.blastname2 neq 'NULL'>#read_title.blastname2#
		</cfif>
		<cfif read_title.bfirstname3 neq '' and read_title.bfirstname3 neq 'NULL'> and #read_title.bfirstname3#
		</cfif>
		<cfif read_title.bminame3 neq '' and read_title.bminame3 neq 'NULL'>#read_title.bminame3#.
		</cfif>
		<cfif read_title.blastname3 neq '' and read_title.blastname3 neq 'NULL'>#read_title.blastname3#
		</cfif>
		<cfif read_title.bfirstname4 neq '' and read_title.bfirstname4 neq 'NULL'> and #read_title.bfirstname4#
		</cfif>
		<cfif read_title.bminame4 neq '' and read_title.bminame4 neq 'NULL'>#read_title.bminame4#.
		</cfif>
		<cfif read_title.blastname4 neq '' and read_title.blastname4 neq 'NULL'>#read_title.blastname4#
		</cfif>
		</cfif></cfoutput><BR><BR>
<cfoutput>Property: #read_title.paddress#,<br>
#read_title.pstate# #read_title.pzip#</cfoutput><BR>
<BR>

<cfif NOT DateDiff("d", Now(), "1/30/2012")>
Issuing Agency: <BR>
First Title & Escrow, Inc. <BR>
30 West Gude Drive <BR>
Suite ## 450 <BR>
Rockville, MD 20850 <BR><BR>
<cfelse>
Issuing Agency: <BR>
First Title & Escrow, Inc. <BR>
7361 Calhoun Place <BR>
Suite ## 200 <BR>
Rockville, MD 20855 <BR><BR>
</cfif>


Dear Madam or Sir:<BR><BR>

&nbsp;&nbsp;&nbsp;Stewart Title Guaranty Company (the “Company”) in consideration of your acceptance of this letter agrees, subject
to the Conditions and Exclusions set forth below, to indemnify you for actual loss of settlement funds incurred by you in
connection with the closing of the Real Estate Transaction conducted by the Issuing Agent or Approved Attorney on or
after the date of this letter, provided:
<BR><BR>
&nbsp;&nbsp;&nbsp;(A) the Company issues or is contractually obligated to issue title insurance for your protection in connection with
the closing of the Real Estate Transaction;
<BR><BR>
&nbsp;&nbsp;&nbsp;(B) you are to be the (i) lender secured by an Insured Mortgage, as defined in the ALTA Loan Policy (6-17-06), its
assignee or a warehouse lender, (ii) purchaser of an interest in land, or (iii) lessee of an interest in land; and
<BR><BR>
&nbsp;&nbsp;&nbsp;(C) the aggregate of all funds you transmit to the Issuing Agent or Approved Attorney for the Real Estate
Transaction does not exceed $5 million, and;
<BR><BR>
&nbsp;&nbsp;&nbsp;further provided the loss arises out of:
<br>
<br>
&nbsp;&nbsp;&nbsp;1. Failure of the Issuing Agent or Approved Attorney to comply with your written closing instructions to the extent
that they relate to (a) the status of the title to that interest in land or the validity, enforceability and priority of the lien of
the mortgage on that interest in land, including the obtaining of documents and the disbursement of funds necessary to
establish the status of title or lien, or (b) the obtaining of any other document, specifically required by you, but only to
the extent the failure to obtain the other document affects the status of the title to that interest in land or the validity,
enforceability and priority of the lien of the mortgage on that interest in land, and not to the extent that your instructions
require a determination of the validity, enforceability or the effectiveness of the other document, or
<br>
<br>
&nbsp;&nbsp;&nbsp;2. Fraud, theft, dishonesty or negligence of the Issuing Agent or Approved Attorney in handling your funds or
documents in connection with the closing to the extent that fraud, theft, dishonesty or negligence relates to the status
of the title to that interest in land or to the validity, enforceability, and priority of the lien of the mortgage on that interest
in land.
<br>
<br>
If you are a lender protected by this letter, your borrower, your assignee and your warehouse lender in connection with
an Insured Mortgage shall be protected as if it was addressed to them.<br>
<br>
<br>


CONDITIONS AND EXCLUSIONS <BR><BR>
<BR>


&nbsp;&nbsp;1. The Company shall have no liability for loss arising out of:<BR><BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a. Failure of the Issuing Agent or Approved Attorney to comply with closing instructions that require title
insurance protection inconsistent with that set forth in the Company’s title insurance binder or commitment.
<BR><BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b. Loss or impairment of your funds in the course of collection or while on deposit with a bank due to bank
failure, insolvency or suspension, except as shall result from failure of the Issuing Agent or Approved Attorney to
comply with your written closing instructions to deposit the funds in a bank which you designated by name.
<BR><BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;c. Defects, liens, encumbrances or other matters in connection with the Real Estate Transaction. This
Exclusion does not affect the coverage afforded in the Company’s title insurance policy issued in connection with the
Real Estate Transaction.
<BR><BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;d. Fraud, theft, dishonesty or negligence of your employee, agent, attorney or broker.
<BR><BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;e. Your settlement or release of any claim without the Company’s written consent.
<BR><BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;f. Any matters created, suffered, assumed or agreed to by you or known to you.
 <BR><BR>

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
