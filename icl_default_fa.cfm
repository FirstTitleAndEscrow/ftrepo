<IE:DEVICERECT ID="<CFOUTPUT><CFIF #read_Title.pstate# eq "CA" OR #read_Title.pstate# eq "NV">page8<CFELSE>Page7</CFIF></cfoutput>" CLASS="masterstyle" MEDIA="print">
	    <table width="100%" cellpadding=0 cellspacing=0 border=0 >

	    <tr>
		  <td colspan="2" align="center" valign="middle" bgcolor="000000" height="30"><B><font color="FFFFFF" size="4">&nbsp;</font></B></td>
	</tr>
	</table>
	   <table width="93%" cellpadding=0 cellspacing=0 border=0 >
<!--- 	   <tr>
          <td width="33%">
         <cfoutput>   <!--- ===/ This is the Title_ID from the Title Table \=== --->
            <NOBR>Order Number: <B>#read_Title.Title_ID#</B></NOBR></td>
            <td align="Center"><!--- <NOBR>Stewart Title Guaranty Company</NOBR> --->&nbsp;</td>
          <td align="right"><NOBR>Commitment Number: D-#read_Title.Title_ID#</NOBR></td></cfoutput>
        </tr>
 --->	   <tr>
          <td COLSPAN = 3><p>&nbsp;</p></td>
        </tr>
        <tr>
          <td colspan = 3 align = "left">
<table width="90%" style="font-family:Arial, Helvetica, sans-serif; font-size:13px;">
<tr>
<td align="left" valign="top" width-"60%">&nbsp;</td>
<td align="left" valign="top" width-"40%">&nbsp;
</td>
</tr>

<tr>
<td align="left" valign="top" colspan="2">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<cfoutput>#DateFormat(Now(),"mm/dd/yyyy")#</cfoutput><br><br>
Name of Issuing Agent or Approved Attorney (hereafter, “Issuing Agent,” or “Approved Attorney”, as the
case may require):<br><br>
<cfif read_ft_company.streamline_client eq 'True'>
STREAMLINE TITLE & ESCROW<br>
<cfelse>
FIRST TITLE & ESCROW, INC.<br>
</cfif>
SERVICES, LLC<br>
7361 CALHOUN PLACE SUITE 200<br>
ROCKVILLE, MD 20855<br><br><br>

Transaction (hereafter, “the Real Estate Transaction”):<br><br>
<cfoutput>
#read_title.bfirstName1# #read_title.blastName1#<br>
#read_title.paddress#<br>
#read_title.pcity#, #read_title.pstate# #read_title.pzip#<br><br>

Loan Number: #read_title.loan_number#<br><br>
</cfoutput>

Dear Sir or Madame:
First American Title Insurance Company (the “Company”) agrees, subject to the Conditions and Exclusions
set forth below, to reimburse you for actual loss incurred by you in connection with the closing of the Real
Estate Transaction conducted by the Issuing Agent or Approved Attorney provided:
<BR><BR>



&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A.     title insurance of the Company is specified for your protection in connection with the closing of the Real
Estate Transaction;<BR><BR>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;B.    you are to be the (i) lender secured by a mortgage (including any other security instrument) of an interest
in land, (ii) purchaser of an interest in land, or (iii) lessee of an interest in land; and<BR><BR>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;C.     the aggregate of all funds you transmit to the Issuing Agent or Approved Attorney for the Real Estate Transaction does not exceed $5,000,000.00 and provided the loss arises out of: <BR><BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.     Failure of the Issuing Agent or Approved Attorney to comply with your written closing instructions to the
extent that they relate to (a) the status of the title to that interest in land or the validity, enforceability and
priority of the lien of the mortgage on that interest in land, including the obtaining of documents and the
disbursement of funds necessary to establish the status of title or lien, or (b) the obtaining of any other
document, specifically required by you, but only to the extent the failure to obtain the other document
affects the status of the title to that interest in land or the validity, enforceability and priority of the lien of
the mortgage on that interest in land, and not to the extent that your instructions require a determination of
the validity, enforceability or the effectiveness of the other document, or<BR><BR>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.     Fraud, dishonesty or negligence of the Issuing Agent or Approved Attorney in handling your funds or
documents in connection with the closing to the extent that fraud, dishonesty or negligence relates to the
status of the title to that interest in land or to the validity, enforceability, and priority of the lien of the
mortgage on that interest in land. <BR><BR>



If you are a lender protected under the foregoing paragraph, your borrower in connection with a loan secured
by a mortgage shall be protected as if this letter were addressed to them.<BR><BR>
<u>Conditions and Exclusions</U><br><br>




&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.	The Company will not be liable to you for loss arising out of:<br><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A.	Failure of the Issuing Agent or Approved Attorney to comply with your closing instructions which
require title insurance protection inconsistent with that set forth in the title insurance binder or
commitment issued by the Company. Instructions which require the removal of specific exceptions
to title or compliance with the requirements contained in the binder or commitment shall not be
deemed to be inconsistent.<BR><BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;B.	Loss or impairment of your funds in the course of collection or while on deposit with a bank due to
bank failure, insolvency or suspension, except as shall result from failure of the Issuing Agent or
Approved Attorney to comply with your written closing instructions to deposit the funds in a bank
which you designated by name.<BR><BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;C.	Defects, liens, encumbrances or other matters in connection with the Real Estate Transaction if it is
a purchase, lease or loan transaction except to the extent that protection against those defects, liens,
encumbrances or other matters is afforded by a policy of title insurance not inconsistent with your
closing instructions.<BR><BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;D.	Fraud, dishonesty or negligence of your employee, agent, attorney or broker.<BR><BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;E.	Your settlement or release of any claim without the written consent of the Company.<BR><BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;F.	Any matters created, suffered, assumed or agreed to by you or known to you.<BR><BR>


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.	If the closing is conducted by an Approved Attorney, a title insurance binder or commitment for the
issuance of a policy of title insurance of the Company must have been received by you prior to the
transmission of your final closing instructions to the Approved Attorney.<BR><BR>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.	When the Company shall have reimbursed you pursuant to this letter, it shall be subrogated to all rights
and remedies which you would have had against any person or property had you not been so
reimbursed. Liability of the Company for such reimbursement shall be reduced to the extent that you
have knowingly and voluntarily impaired the value of this right of subrogation.<BR><BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.	The Issuing Agent is the Company’s agent only for the limited purpose of issuing title insurance
policies. Neither the Issuing Agent nor the Approved Attorney is the Company’s agent for the purpose
of providing other closing or settlement services. The Company’s liability for your losses arising from
those other closing or settlement services is strictly limited to the protection expressly provided in this
letter. Any liability of the Company for loss does not include liability for loss resulting from the
negligence, fraud or bad faith of any party to a real estate transaction other than an Issuing Agent or
Approved Attorney; the lack of creditworthiness of any borrower connected with a real estate
transaction, or the failure of any collateral to adequately secure a loan connected with a real estate
transaction. However, this letter does not affect the Company’s liability with respect to its title
insurance binders, commitments or policies.<BR><BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5.	You must promptly send written notice of a claim under this letter to the Company at its principal office
at First American Title Insurance Company, Attn: Claims National Intake Center, 1 First American
Way, Santa Ana, CA 92707. The company is not liable for a loss if the written notice is not received
within one year from the date of the closing.
<br><br>
Any previous insured closing service letter or similar agreement is hereby canceled with respect to the Real
Estate Transaction.
<BR><BR>
First American Title Insurance Company
<br><br>
BY:

<br><br>
<img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/fa_icl_sig.jpg" width="200"><BR>
Phillip Sholar, SVP, Director of Underwriting<BR>
<br><br><br><br>
<cfif NOT DateDiff("d", Now(), "1/30/2012")>
<center>
<cfif NOT DateDiff("d", Now(), "1/30/2012")>
30 West Gude Drive Suite # 450 * Rockville, MD 20850 * (301)279-0303 <BR><BR>
<cfelse>
7361 Calhoun Place, Suite # 200 * Rockville, MD 20855 * (301)279-0303 <BR><BR>
</cfif>

</center>
<cfelse>
<center>
7361 Calhoun Place, Suite # 200 * Rockville, MD 20855 * (301)279-0303 <BR><BR>
</center>
</cfif>





		  </td>
        </tr>

      </table>
	</IE:DEVICERECT>
