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
            <NOBR>Stewart Title Guaranty Company</NOBR>
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


<cfif read_title.comp_id eq 3251>
<CFif read_keystone.recordcount>
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
</table>
<CFOUTPUT>
<style>
TD {font-family:Arial, Helvetica, sans-serif; font-size:12px; color:black;}
.tableframe {border-top-color:black; 
          border-top-width:1px;
		  border-top-style:solid;
		  border-bottom-color:black; 
          border-bottom-width:1px;
		  border-bottom-style:solid;
		  border-left-color:black; 
          border-left-width:1px;
		  border-left-style:solid;
		  border-right-color:black; 
          border-right-width:1px;
		  border-right-style:solid;}
input   {font-size: 9; 
		font-family: verdana; 
		font-style: normal; 
		color: 003F1E; 
		background-color: E4E3E3; 
		border-color: white; 
		border-left-width: thin; 
		border-right-width: thin; 
		border-top-width: thin; 
		border-bottom-width: thin; 
		border-width: thin; 
		border-style: bar; 
		clear: none;}
</style>
<table width="700" class="tableframe" cellpadding="6" cellspacing="6">
<tr>
<td width="100%"> 

<div align="center">
<table width="200" cellpadding="6" cellspacing="6"><tr><td class="tableframe" align="center">
<strong>REO Title Summary</strong>
</td></tr></table>
</div>
<br>
<br>
REO ## 926459<BR>
Client Name: Chase Home Finance<BR>
Loan ## 24655177<BR>
Property Address: 3519 REISTERSTOWN RD,BALTIMORE, MD 21215<BR>
<BR>
<BR>
<BR>
<table>
<tr>
<td width="50" align="left" valign="top">TO:</td>
<td align="left" valign="top"><strong>Streamline, Title & Escrow Services, LLC</strong><br>
Attention: #read_keystone.attn#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Phone ##  #read_keystone.attn_phone#</td>
</tr>
<tr>
<td colspan="2" align="left" valign="top">FC Sale Held: #read_keystone.FC_held#&nbsp;&nbsp;Confirmed/Redemption Expiration: #read_keystone.confirmed_expiration#&nbsp;&nbsp;FC Sale Deed Recorded:&nbsp;&nbsp;Date #read_keystone.sale_recorded_date#</td>
</tr>
<tr>
<td colspan="2" align="left" valign="top">Doc ##: #read_keystone.doc_num#&nbsp;&nbsp;Book ##: #read_keystone.book_num#&nbsp;&nbsp;Page ##: #read_keystone.page_num#</td>
</tr>
<tr>
<td colspan="2" align="left" valign="top">Reason if not recorded: #read_keystone.reason_not_recorded#</td>
</tr>
<tr>
<td colspan="2" align="left" valign="top"><HR></td>
</tr>

<tr>
<td colspan="2" align="left" valign="top">Please review title and verify the following:</td>
</tr>
<tr>
<td width="125" align="left" valign="top">&nbsp;</td>
<td align="left" valign="top">Title vested in name of: #read_keystone.title_vested_name#</td>
</tr>
<tr>
<td width="125" align="left" valign="top">&nbsp;</td>
<td align="left" valign="top">Client’s lien position:    1st #read_keystone.first_lien#&nbsp;&nbsp;&nbsp;2nd #read_keystone.second_lien#&nbsp;&nbsp;&nbsp;(Sr. lien held by: #read_keystone.senior_lien#)</td>
</tr>
<tr>
<td width="125" align="left" valign="top">&nbsp;</td>
<td align="left" valign="top">If other, explain: #read_keystone.first_lien#<br>
<br>
</td>
</tr>
<tr>
<td colspan="2" align="left" valign="top"><HR></td>
</tr>
<tr>
<td colspan="2" align="left" valign="top">Please note any issues, including but not limited to:</td>
</tr>
<tr>
<td colspan="2" align="left" valign="top"><HR></td>
</tr>
<tr>
<td width="125" align="left" valign="top">Taxes:</td>
<td align="left" valign="top">Next Due #read_keystone.taxes_next_due#&nbsp;&nbsp;&nbsp;$ #read_keystone.taxes_due_amount#&nbsp;&nbsp;&nbsp;Year(s) #read_keystone.taxes_due_years#&nbsp;&nbsp;&nbsp;Type #read_keystone.taxes_due_type#
</td>
</tr>
<tr>
<td width="125" align="left" valign="top">&nbsp;</td>
<td align="left" valign="top">Delinquent  (breakdown) #read_keystone.delinquent_breakdown#</td>
</tr>
<tr>
<td colspan="2" align="left" valign="top"><HR></td>
</tr>
<tr>
<td width="125" align="left" valign="top">Special Assessment / Utility Taxes:</td>
<td align="left" valign="top">Due: #read_keystone.special_taxes_due#&nbsp;&nbsp;&nbsp;Type #read_keystone.special_taxes_type#&nbsp;&nbsp;&nbsp;$ #read_keystone.special_taxes_amount#</td>
</tr>
<tr>
<td colspan="2" align="left" valign="top"><HR></td>
</tr>
<tr>
<td width="125" align="left" valign="top">Open Bankruptcy:</td>
<td align="left" valign="top">Filed By: #read_keystone.bankruptcy_filed_by#&nbsp;&nbsp;&nbsp;Date Filed #read_keystone.bankruptcy_date_filed#</td>
</tr>
<tr>
<td width="125" align="left" valign="top">&nbsp;</td>
<td align="left" valign="top">Case #/Chapter: #read_keystone.bankruptcy_case_number#&nbsp;&nbsp;&nbsp;District & State: #read_keystone.bankruptcy_state#</td>
</tr>
<tr>
<td colspan="2" align="left" valign="top"><HR></td>
</tr>
<tr>
<td colspan="2" align="left" valign="top">Exceptions  (MUST list all loans/liens that are showing of record):</td>
</tr>
<tr>
<td colspan="2" align="left" valign="top"><HR></td>
</tr>
<tr>
<td width="125" align="left" valign="top">Prior/open liens:</td>
<td align="left" valign="top">Dated: #read_keystone.prior_lien1_date#&nbsp;&nbsp;&nbsp;$ #read_keystone.prior_lien1_amount#</td>
</tr>
<tr>
<td width="125" align="left" valign="top">&nbsp;</td>
<td align="left" valign="top">Recorded: #read_keystone.prior_lien1_recorded#&nbsp;&nbsp;&nbsp;Book/Page #: #read_keystone.prior_lien1_bookpage#</td>
</tr>
<tr>
<td width="125" align="left" valign="top">&nbsp;</td>
<td align="left" valign="top">Beneficiary: #read_keystone.prior_lien1_beneficiary#</td>
</tr>
<tr>
<td width="125" align="left" valign="top">&nbsp;</td>
<td align="left" valign="top">Grantee: #read_keystone.prior_lien1_grantee#</td>
</tr>
<tr>
<td width="125" align="left" valign="top">&nbsp;</td>
<td align="left" valign="top">&nbsp;</td>
</tr>




<tr>
<td width="125" align="left" valign="top">&nbsp;</td>
<td align="left" valign="top">Dated: #read_keystone.prior_lien2_date#&nbsp;&nbsp;&nbsp;$ #read_keystone.prior_lien2_amount#</td>
</tr>
<tr>
<td width="125" align="left" valign="top">&nbsp;</td>
<td align="left" valign="top">Recorded: #read_keystone.prior_lien2_recorded#&nbsp;&nbsp;&nbsp;Book/Page #: #read_keystone.prior_lien2_bookpage#</td>
</tr>
<tr>
<td width="125" align="left" valign="top">&nbsp;</td>
<td align="left" valign="top">Beneficiary: #read_keystone.prior_lien2_beneficiary#</td>
</tr>
<tr>
<td width="125" align="left" valign="top">&nbsp;</td>
<td align="left" valign="top">Grantee: #read_keystone.prior_lien2_grantee#</td>
</tr>
<tr>
<td width="125" align="left" valign="top">&nbsp;</td>
<td align="left" valign="top">&nbsp;</td>
</tr>

<tr>
<td colspan="2" align="left" valign="top">Assignment issue(s) (specify):</td>
</tr>
<tr>
<td colspan="2" align="left" valign="top">If lien (s) still existing, did we receive an indemnity letter from originating title company to clear these issues?: #read_keystone.indemnity_letter#</td>
</tr>




<tr>
<td colspan="2" align="left" valign="top"><HR></td>
</tr>
<tr>
<td width="125" align="left" valign="top">Subordinate loans/liens:</td>
<td align="left" valign="top">Dated: #read_keystone.sub_lien1_date#&nbsp;&nbsp;&nbsp;$ #read_keystone.sub_lien1_amount#</td>
</tr>
<tr>
<td width="125" align="left" valign="top">&nbsp;</td>
<td align="left" valign="top">Recorded: #read_keystone.sub_lien1_recorded#">&nbsp;&nbsp;&nbsp;Book/Page #: #read_keystone.sub_lien1_bookpage#</td>
</tr>
<tr>
<td width="125" align="left" valign="top">&nbsp;</td>
<td align="left" valign="top">Beneficiary: #read_keystone.sub_lien1_beneficiary#</td>
</tr>
<tr>
<td width="125" align="left" valign="top">&nbsp;</td>
<td align="left" valign="top">Grantee: #read_keystone.sub_lien1_grantee#</td>
</tr>
<tr>
<td width="125" align="left" valign="top">&nbsp;</td>
<td align="left" valign="top">&nbsp;</td>
</tr>


<tr>
<td width="125" align="left" valign="top">&nbsp;</td>
<td align="left" valign="top">Dated: #read_keystone.sub_lien2_date#&nbsp;&nbsp;&nbsp;$ #read_keystone.sub_lien2_amount#</td>
</tr>
<tr>

<td width="125" align="left" valign="top">&nbsp;</td>
<td align="left" valign="top">Recorded: #read_keystone.sub_lien2_recorded#&nbsp;&nbsp;&nbsp;Book/Page #: #read_keystone.sub_lien2_bookpage#</td>
</tr>
<tr>
<td width="125" align="left" valign="top">&nbsp;</td>
<td align="left" valign="top">Beneficiary: #read_keystone.sub_lien2_beneficiary#</td>
</tr>
<tr>
<td width="125" align="left" valign="top">&nbsp;</td>
<td align="left" valign="top">Grantee: #read_keystone.sub_lien2_grantee#</td>
</tr>
<tr>
<td width="125" align="left" valign="top">&nbsp;</td>
<td align="left" valign="top">&nbsp;</td>
</tr>

<tr>
<td colspan="2" align="left" valign="top"><HR></td>
</tr>
<tr>
<td width="125" align="left" valign="top">Federal Tax Liens:</td>
<td align="left" valign="top">Dated: #read_keystone.fed_tax_lien1_date#&nbsp;&nbsp;&nbsp;$ #read_keystone.fed_tax_lien1_amount#</td>
</tr>
<tr>
<td width="125" align="left" valign="top">&nbsp;</td>
<td align="left" valign="top">Dated: #read_keystone.fed_tax_lien1_date#&nbsp;&nbsp;&nbsp;$ #read_keystone.fed_tax_lien1_amount#</td>
</tr>



<tr>
<td colspan="2" align="left" valign="top"><HR></td>
</tr>
<tr>
<td colspan="2" align="left" valign="top">Was the IRS given proper notification and therefore lien(s) no longer an issue?: #read_keystone.irs_notification#</td>
</tr>
<tr>
<td colspan="2" align="left" valign="top"><HR></td>
</tr>
<tr>
<td colspan="2" align="left" valign="top">Mobile Home issues (i.e. not converted to Real Property): #read_keystone.mobile_home_issues#</td>
</tr>
<tr>
<td colspan="2" align="left" valign="top"><HR></td>
</tr>
<tr>
<td colspan="2" align="left" valign="top">Land/survey/encroachment issues: #read_keystone.land_survey_issues#</td>
</tr>
<tr>
<td colspan="2" align="left" valign="top"><HR></td>
</tr>
<tr>
<td width="125" align="left" valign="top">Other:</td>
<td align="left" valign="top">#read_keystone.other_issues#<br>
<br>
<br>
<br>
</td>
</tr>
<tr>
<td>&nbsp;</td>
<td align="left" valign="top">Reviewed By: #read_keystone.reviewed_by#&nbsp;&nbsp;&nbsp;&nbsp;Date: #read_keystone.reviewed_date#</td>
</tr>

</td></tr></table>
</CFOUTPUT>
</cfif>
</cfif>
          </td>  
        
    </tr>
</table>
<!--- ====================================================================== --->
<!--- =================[ END OF SCHEDULE A         ]======================== --->
<!--- ====================================================================== --->
</IE:DEVICERECT><P>