<!--- <p style="page-break-after:always;">&nbsp;</p> --->
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
<td align="left" valign="top" width-"40%">Kenneth P. Bayne<BR>
District Manager<BR>
phone (410) 789-8400<BR>
fax (410) 789-8407<BR><BR>
<BR><BR>
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
<cfif read_FT_Company.company contains "Flagstar Bank">Borrower: <cfoutput>#Buyer_1#<cfif IsDefined("buyer_2")>, #Buyer_2#</cfif></cfoutput><BR>
<cfoutput>Property: #read_title.paddress#, #read_title.pstate# #read_title.pzip#</cfoutput><BR></cfif>

<cfif read_title.comp_ID eq 3943 or read_title.comp_ID eq 4042 or read_title.comp_ID eq 4043 or read_title.comp_ID eq 4702 or read_title.comp_ID eq 4752 or read_title.comp_ID eq 3722>
	<cfoutput>
	<cfif read_title.company1 neq '' and read_title.company1 neq 'NULL'>#read_title.company1#
	<cfelse>
		#read_title.full_vesting#
		</cfif><br>
		#read_title.paddress#,<br>
		#read_title.pcity#, #read_title.pstate# #read_title.pzip#<br>
		<cfif read_title.loan_number neq '' and read_title.loan_number neq 'NULL'>Loan No. #read_title.loan_number#
	</cfif>
	</cfoutput><BR>
</cfif>

<BR>

Issuing Agency: <BR>
<cfif NOT DateDiff("d", Now(), "1/30/2012")>
First Title & Escrow, Inc. <BR>
30 West Gude Drive <BR>
Suite # 450 <BR>
Rockville, MD 20850 <BR><BR>
<cfelse>
First Title & Escrow, Inc. <BR>
7361 Calhoun Place <BR>
Suite # 200 <BR>
Rockville, MD 20855 <BR><BR>
</cfif>Dear Madam or Sir:<BR><BR>

&nbsp;&nbsp;&nbsp;When title insurance of Stewart Title Guaranty Company (the "Company") is specified for your protection in
connection with closings of real estate transactions in which you are to be the: (a) lessee of an interest in land, (b)
purchaser of an interest in land, or (c) lender secured by a mortgage (including any other security instrument) of an
interest in land, its assignees or a warehouse lender, the Company, subject to the Conditions and Exclusions set forth
below, hereby agrees to reimburse you actual loss incurred by you in connection with such closings when conducted
by the Issuing Agent (an agent authorized to issue title insurance for the Company) or the Approved Attorney (an
attorney upon whose certification of title the Company issues title insurance) and when such loss arises out of: <BR>
<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1. Failure of the Issuing Agent or Approved Attorney to comply with your written closing instructions to the extent
that they relate to (a) the status of the title to said interest in land or the validity, enforceability and priority of the lien of
said mortgage on said interest in land, including the obtaining of documents and the disbursement of funds necessary
to establish such status of title or lien, or (b) the obtaining of any other document, specifically required by you, but not
to the extent that said instructions require a determination of the validity, enforceability or effectiveness of such other
document, or (c) the collection and payment of funds due you, or <BR><BR>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2. Fraud, dishonesty or negligence of the Issuing Agent or Approved Attorney in handling your funds or
documents in connection with such closings to the extent such fraud, dishonesty or negligence relates to the status of
the title to said interest in land or to the validity, enforceability, and priority of the lien of said mortgage on said interest
in land.
If you are a lender protected under the foregoing paragraph, your borrower, your assignee and your warehouse
lender in connection with a loan secured by a mortgage shall be protected as if this letter were addressed to them. <BR><BR>
<BR>


CONDITIONS AND EXCLUSIONS <BR><BR>
<BR>


1.  The Company will not be liable to you for loss arising out of: <BR><BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A. Failure of the Issuing Agent or Approved Attorney to comply with your closing instructions which require title
insurance protection inconsistent with that set forth in the title insurance binder or commitment issued by the Company.
Instructions which require the removal of specific exceptions to title or compliance with the requirements contained in
said binder or commitment shall not be deemed to be inconsistent. <BR><BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;B. Loss or impairment of your funds in the course of collection or while on deposit with a bank due to bank
failure, insolvency or suspension, except such as shall result from failure of the Issuing Agent or the Approved Attorney
to comply with your written closing instructions to deposit the funds in a bank which you designated by name. <BR><BR>
 </td>
        </tr>
      </table>
	</IE:DEVICERECT>
