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
CSenior VP / Chief Underwriting & Associate General Counsel<BR>
Stewart Title Guaranty -Home Office<BR>
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

When title insurance is specified in connection with closing of the above-described real estate transaction (the
“Closing”) in which Closing you are the Covered Party hereunder with an interest in land or a lender secured by a
mortgage (including any other security instrument) of an interest in land, Stewart Title Guaranty Company (the
“Company”), subject to the Conditions and Exclusions set forth below, hereby agrees to reimburse you for actual loss
incurred by you in connection with the Closing, when such Closing is conducted by the above named Licensed Agent
(an agent licensed and authorized to issue title insurance in the State of Ohio for the Company) and where such loss
arises out of:<BR>
<BR>
&nbsp;&nbsp;&nbsp;1. Theft, misappropriation, fraud or any other failure of the Licensed Agent, or anyone acting on the Licensed
Agent’s behalf, to properly handle and disburse your funds or documents in connection with such Closing; or
<br>
<br>
&nbsp;&nbsp;&nbsp;2. Failure of the Licensed Agent, or anyone acting on the Licensed Agent’s behalf, to comply with any applicable
written closing instructions, when agreed to by the Licensed Agent, to the extent that they relate to: (a) the status of the
title to said interest in land or the marketability thereof as insured or the validity, enforceability and priority of the lien of
said mortgage on said interest in land, including the obtaining of documents and the disbursement of funds necessary
to establish such status of title or lien, or (b) the obtaining of any other document, specifically required by you, but only
to the extent the failure to obtain such other document affects the status of the title to said interest in land or the
validity, enforceability and priority of the lien of said mortgage on said interest in land, but not to the extent that said
instructions require a determination of the validity, enforceability or effectiveness of such other document.
<br>
<br>


CONDITIONS AND EXCLUSIONS <BR><BR>
<BR>


A. The Company will not be liable to you for loss arising out of:<BR><BR>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1. Loss or impairment of your funds in the course of collection or while on deposit with a bank due to bank
failure, insolvency or suspension, except as shall result from failure of the Licensed Agent to comply with your written
closing instructions to deposit the funds in a bank which you designate by name.
<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2. Mechanics’ and materialmen’s liens in connection with your purchase or lease or construction loan
transactions, except to the extent that protection against such liens is afforded by a title insurance binder, commitment
or policy.
<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3. Matters created, suffered, assumed or agreed to by you and/or your agents or employees.
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
