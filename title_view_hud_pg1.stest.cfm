<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>


<CFQUERY datasource="#request.dsn#" NAME="read_data">
			SELECT *
			FROM hud_form_title_pg1
			WHERE Title_ID = #rec_id#
		</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_data2">
			SELECT *
			FROM hud_form_title_pg2
			WHERE Title_ID = #rec_id#
		</CFQUERY>


<CFQUERY datasource="#request.dsn#" NAME="get_titleid">
			SELECT *
			FROM title
			WHERE Title_ID = #rec_id#
		</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="get_billing_states">
		SELECT *
		FROM  Company_Billing_states
		WHERE company_id = #get_titleid.comp_id# AND a_states = '#get_titleid.pstate#'

</CFQUERY>
<cfif #get_billing_states.recordcount# GT "0">
<CFQUERY datasource="#request.dsn#" NAME="get_line_costs">
		SELECT *
		FROM Company_Billing_Values
		WHERE company_id = #get_titleid.comp_id# AND billing_id = #get_billing_states.billing_id#
	</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_agency">
		SELECT title_ft_agency_name
		FROM  company_agency_assoc
		WHERE billing_id = '#get_billing_states.billing_id#'

</CFQUERY>

<cfelse>
<cfset #read_agency.TITLE_FT_AGENCY_NAME# = "No Agency assigned">
<cfset #get_line_costs.A_1111_TEXT# = "">
<cfset #get_line_costs.A_1112_TEXT# = "">
<cfset #get_line_costs.A_1113_TEXT# = "">
<cfset #get_line_costs.A_1205_TEXT# = "">
<cfset #get_line_costs.A_1303_TEXT# = "">
<cfset #get_line_costs.A_1304_TEXT# = "">
<cfset #get_line_costs.A_1305_TEXT# = "">
</cfif>


<BODY BGCOLOR=white TEXT="#000000" LINK="#FF0000" VLINK="#800000" ALINK="#FF00FF" marginheight=0 marginwidth=0 topmargin=0 leftmargin=0>
<CFOUTPUT>
<table align="center" width="720" cellspacing=0 cellpadding=0 >
   <tr>
      <td width="56%"><b><font face="Arial, Helvetica, sans-serif" size="0.5">A.
         </font><font face="Times New Roman, Times, serif">Settlement Statement</font></b></td>
      <td width="44%"><font face="Arial, Helvetica, sans-serif" size="0.5">US Department
         of Housing</font></td>
   </tr>
   <tr>
      <td width="56%"><font face="Arial, Helvetica, sans-serif" size="0.5">B. Type
         of Loan</font></td>
      <td width="44%"><font face="Arial, Helvetica, sans-serif" size="0.5">and Urban
         Development OMB No. 2502-0265</font></td>
   </tr>
</table>
   <table border="1" cellspacing=0 cellpadding=0 align = "center" width="720" bordercolordark="666666" bordercolorlight="666666" bordercolor="666666">
      <tr>
         <td align="center">
            <table align="center" width="100%" cellspacing=0 cellpadding=0 border="1">
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="0.5">1.
                     <CFIF #read_data.a_1# EQ "FHA">
                     <img src="./images/checkbox_checked.gif">
                     <CFELSE>
                     <img src="./images/checkbox1.gif">
                     </CFIF>
                     FHA&nbsp;&nbsp;&nbsp;&nbsp;2.
                     <CFIF #read_data.a_1# EQ "FmHA">
                     <img src="./images/checkbox_checked.gif">
                     <CFELSE>
                     <img src="./images/checkbox1.gif">
                     </CFIF>
                     FmHA&nbsp;&nbsp;&nbsp;&nbsp;3.
                     <CFIF #read_data.a_1# EQ "Conventional">
                     <img src="./images/checkbox_checked.gif">
                     <CFELSE>
                     <img src="./images/checkbox1.gif">
                     </CFIF>
                     Conv. Unins.<br>
                     4.
                     <CFIF #read_data.a_1# EQ "VA">
                     <img src="./images/checkbox_checked.gif">
                     <CFELSE>
                     <img src="./images/checkbox1.gif">
                     </CFIF>
                     VA&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5.
                     <CFIF #read_data.a_1# EQ "Conv. Ins.">
                     <img src="./images/checkbox_checked.gif">
                     <CFELSE>
                     <img src="./images/checkbox1.gif">
                     </CFIF>
                     Conv. Ins. </font></td>
                  <td width="17%"><font face="Arial, Helvetica, sans-serif" size="0.5">
                     6. File Number<br>
                     <b><font face="Times New Roman, Times, serif" size="0.5" color="blue">#read_data.a_6#</font></b></font></td>
                  <td width="19%"><font face="Arial, Helvetica, sans-serif" size="0.5">7.
                     Loan Number<br>
                     <b><font face="Times New Roman, Times, serif" size="0.5" color="blue">#read_data.a_7#</font></b></font></td>
                  <td width="27%"><font face="Arial, Helvetica, sans-serif" size="0.5">8.
                     Mortgage Insurance Case Number<br>
                     <b><font face="Times New Roman, Times, serif" size="0.5" color="blue">#read_data.a_8#</font></b></font></td>
               </tr>
            </table>
         </td>
      </tr>
      <tr>
         <td align="center">
            <table align="center" cellspacing=0 cellpadding=0 width="100%">
               <tr valign="top">
                  <td width="43"><font face="Arial, Helvetica, sans-serif" size="0.5">
                     C. Note: </font></td>
                  <td width="671"><font face="Arial, Helvetica, sans-serif" size="0.5">This
                     form is furnished to give you a statement of the actual settlement
                     costs. Amounts paid by and to the settlement agent are shown.
                     Items marked "(p.o.c)" were paid outside the closing; they
                     are shown here for information purposes and are not included
                     in the totals. WARNING: It is a crime to knowlingly make
                     false statements to the United states on this or any other
                     similar form. Penalties upon conviction can include a fine
                     and imprisonment. For details see; Title 18 U.S. Code Section
                     1001 and Section 1010. </font></td>
               </tr>
            </table>
         </td>
      </tr>
      <tr>
         <td align="center">
            <table align="center" cellspacing=0 cellpadding=0 width="100%">
               <tr valign="top">
                  <td width="24%"><font face="Arial, Helvetica, sans-serif" size="0.5">D.
                     NAME OF BORROWER:</font></td>
                  <td width="76%"><b><font face="Times New Roman, Times, serif" size="0.5" color="blue">#read_data.d_bname#</font></b></td>
               </tr>
               <tr valign="top">
                  <td width="24%"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;&nbsp;&nbsp;&nbsp;ADDRESS:</font></td>
                  <td width="76%"><b><font face="Times New Roman, Times, serif" size="0.5" color="blue">#read_data.d_baddr#</font></b></td>
               </tr>
            </table>
         </td>
      </tr>
      <tr>
         <td align="center" height="30">
            <table align="center" cellspacing=0 cellpadding=0 width="100%">
               <tr valign="top">
                  <td width="24%"><font face="Arial, Helvetica, sans-serif" size="0.5">E.
                     NAME OF SELLER:</font></td>
                  <td width="76%"><b><font face="Times New Roman, Times, serif" size="0.5" color="blue">#read_data.e_sname#</font></b></td>
               </tr>
               <tr valign="top">
                  <td width="24%"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;&nbsp;&nbsp;&nbsp;ADDRESS:</font></td>
                  <td width="76%"><b><font face="Times New Roman, Times, serif" size="0.5" color="blue">#read_data.e_saddr#</font></b></td>
               </tr>
            </table>
         </td>
      </tr>
      <tr>
         <td align="center">
            <table align="center" cellspacing=0 cellpadding=0 width="100%">
               <tr valign="top">
                  <td width="24%"><font face="Arial, Helvetica, sans-serif" size="0.5">F.
                     NAME OF LENDER:</font></td>
                  <td width="76%"><b><font face="Times New Roman, Times, serif" size="0.5" color="blue">#read_data.f_lname#</font></b></td>
               </tr>
               <tr valign="top">
                  <td width="24%"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;&nbsp;&nbsp;&nbsp;ADDRESS:</font></td>
                  <td width="76%"><b><font face="Times New Roman, Times, serif" size="0.5" color="blue">#read_data.f_laddr#</font></b></td>
               </tr>
            </table>
         </td>
      </tr>
      <tr>
         <td align="center">
            <table align="center" cellspacing=0 cellpadding=0 width="100%">
               <tr valign="top">
                  <td width="24%"><font face="Arial, Helvetica, sans-serif" size="0.5">G.
                     PROPERTY ADDRESS:</font></td>
                  <td width="76%"><b><font face="Times New Roman, Times, serif" size="0.5" color="blue">#read_data.g_propaddr#</font></b></td>
               </tr>
            </table>
         </td>
      </tr>
      <tr>
         <td align="center">
            <table align="center" cellspacing=0 cellpadding=0 width="100%">
               <tr valign="top">
                  <td width="24%"><font face="Arial, Helvetica, sans-serif" size="0.5">H.
                     SETTLEMENT AGENT:</font></td>
                  <td width="76%"><b><font face="Times New Roman, Times, serif" size="0.5" color="blue">#read_agency.title_FT_Agency_name#</font></b></td>
               </tr>
               <tr valign="top">
                  <td width="24%"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;&nbsp;&nbsp;&nbsp;PLACE
                     OF SETTLEMENT:</font></td>
                  <cfif NOT DateDiff("d", Now(), "1/30/2012")><td width="76%"><b><font face="Times New Roman, Times, serif" size="0.5" color="blue">30
                     W. Gude Dr. Rockville, MD. 20850 - Montgomery County</font></b></td><cfelse><td width="76%"><b><font face="Times New Roman, Times, serif" size="0.5" color="blue">7361 Calhoun Place, Suite 200. Rockville, MD. 20855 - Montgomery County</font></b></td></cfif>
               </tr>
            </table>
         </td>
      </tr>
      <tr>
         <td align="center">
            <table align="center" cellspacing=0 cellpadding=0 width="100%">
               <tr valign="top">
                  <td width="24%"><font face="Arial, Helvetica, sans-serif" size="0.5">I.
                     SETTLEMENT DATE:</font></td>
                  <td width="76%"><b><font face="Times New Roman, Times, serif" size="0.5" color="blue">#read_data.i_settlementDate#</font></b></td>
               </tr>
            </table>
         </td>
      </tr>
      <tr>
         <td align="center">
            <table align="center" cellspacing=0 cellpadding=0 width="100%" border="1">
               <tr valign="top" align="center">
                  <td colspan="2"><font face="Arial, Helvetica, sans-serif" size="0.5"><b>J.
                     SUMMARY OF BORROWERS TRANSACTIONS:</b></font></td>
                  <td colspan="2"><font face="Arial, Helvetica, sans-serif" size="0.5"><b>K.
                     SUMMARY OF SELLERS TRANSACTIONS:</b></font></td>
               </tr>
               <tr valign="top">
                  <td colspan="2"><font face="Arial, Helvetica, sans-serif" size="0.5">100.
                     GROSS AMOUNT DUE FROM BORROWER</font></td>
                  <td colspan="2"><font face="Arial, Helvetica, sans-serif" size="0.5">400.
                     GROSS AMOUNT DUE TO SELLER: </font></td>
               </tr>
               <tr valign="top">
                  <td width="33%"><font face="Arial, Helvetica, sans-serif" size="0.5">101.
                     Contract Sales Price </font></td>
                  <td width="17%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;<b><font color="blue">#read_data.a_101#</font></b></font></div>
                  </td>
                  <td width="34%"><font face="Arial, Helvetica, sans-serif" size="0.5">401.
                     Contract Sales Price </font></td>
                  <td width="16%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;<b><font color="blue">#read_data.a_401#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="33%"><font face="Arial, Helvetica, sans-serif" size="0.5">102.
                     Personal Property </font></td>
                  <td width="17%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;<b><font color="blue">#read_data.a_102#</font></b></font></div>
                  </td>
                  <td width="34%"><font face="Arial, Helvetica, sans-serif" size="0.5">402.
                     Personal Property </font></td>
                  <td width="16%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;<b><font color="blue">#read_data.a_402#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="33%"><font face="Arial, Helvetica, sans-serif" size="0.5">103.
                     Settlement charges to buyer (line 1400) </font></td>
                  <td width="17%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;<b><font color="blue">#read_data.a_103#</font></b></font></div>
                  </td>
                  <td width="34%"><font face="Arial, Helvetica, sans-serif" size="0.5">403.
                     #read_data.a_403_a#</font></td>
                  <td width="16%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;<b><font color="blue">#read_data.a_403_b#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="33%"><font face="Arial, Helvetica, sans-serif" size="0.5">104.
                     #read_data.a_104_a# </font></td>
                  <td width="17%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;<b><font color="blue">#read_data.a_104_b#</font></b></font></div>
                  </td>
                  <td width="34%"><font face="Arial, Helvetica, sans-serif" size="0.5">404.
                     #read_data.a_404_a#</font></td>
                  <td width="16%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;<b><font color="blue">#read_data.a_404_b#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="33%"><font face="Arial, Helvetica, sans-serif" size="0.5">105.
                     #read_data.a_105_a# </font></td>
                  <td width="17%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;<b><font color="blue">#read_data.a_105_b#</font></b></font></div>
                  </td>
                  <td width="34%"><font face="Arial, Helvetica, sans-serif" size="0.5">405.
                     #read_data.a_405_a#</font></td>
                  <td width="16%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;<b><font color="blue">#read_data.a_405_b#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td colspan="2" align="center"><font face="Arial, Helvetica, sans-serif" size="0.5">Adjustments
                     for items paid by seller in advance </font></td>
                  <td colspan="2">
                     <div align="center"><font face="Arial, Helvetica, sans-serif" size="0.5">Adjustments
                        for items paid by seller in advance </font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="33%"><font face="Arial, Helvetica, sans-serif" size="0.5">106.
                     City / town taxes </font></td>
                  <td width="17%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;<b><font color="blue">#read_data.a_106#</font></b></font></div>
                  </td>
                  <td width="34%"><font face="Arial, Helvetica, sans-serif" size="0.5">406.
                     City / town taxes </font></td>
                  <td width="16%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;<b><font color="blue">#read_data.a_406#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="33%"><font face="Arial, Helvetica, sans-serif" size="0.5">107.
                     County Taxes </font></td>
                  <td width="17%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;<b><font color="blue"><B>#read_data.a_107#</B></font></b></font></div>
                  </td>
                  <td width="34%"><font face="Arial, Helvetica, sans-serif" size="0.5">407.
                     County Taxes </font></td>
                  <td width="16%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;<b><font color="blue">#read_data.a_407#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="33%"><font face="Arial, Helvetica, sans-serif" size="0.5">108.
                     Assessments </font></td>
                  <td width="17%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;<b><font color="blue"><B>#read_data.a_108#</B></font></b></font></div>
                  </td>
                  <td width="34%"><font face="Arial, Helvetica, sans-serif" size="0.5">408.
                     Assessments </font></td>
                  <td width="16%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;<b><font color="blue">#read_data.a_408#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="33%"><font face="Arial, Helvetica, sans-serif" size="0.5">109.
                     #read_data.a_109_a#</font></td>
                  <td width="17%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;<b><font color="blue">#read_data.a_109_b#</font></b></font></div>
                  </td>
                  <td width="34%"><font face="Arial, Helvetica, sans-serif" size="0.5">409.
                     #read_data.a_409_a#</font></td>
                  <td width="16%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;<b><font color="blue">#read_data.a_409_b#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="33%"><font face="Arial, Helvetica, sans-serif" size="0.5">110.
                     #read_data.a_110_a#</font></td>
                  <td width="17%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;<b><font color="blue">#read_data.a_110_b#</font></b></font></div>
                  </td>
                  <td width="34%"><font face="Arial, Helvetica, sans-serif" size="0.5">410.
                     #read_data.a_410_a#</font></td>
                  <td width="16%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;<b><font color="blue">#read_data.a_410_b#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="33%"><font face="Arial, Helvetica, sans-serif" size="0.5">111.
                     #read_data.a_111_a#</font></td>
                  <td width="17%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;<b><font color="blue">#read_data.a_111_b#</font></b></font></div>
                  </td>
                  <td width="34%"><font face="Arial, Helvetica, sans-serif" size="0.5">411.
                     #read_data.a_411_a#</font></td>
                  <td width="16%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;<b><font color="blue">#read_data.a_411_b#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="33%"><font face="Arial, Helvetica, sans-serif" size="0.5">112.
                     #read_data.a_112_a#</font></td>
                  <td width="17%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;<b><font color="blue">#read_data.a_112_b#</font></b></font></div>
                  </td>
                  <td width="34%"><font face="Arial, Helvetica, sans-serif" size="0.5">412.
                     #read_data.a_412_a#</font></td>
                  <td width="16%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;<b><font color="blue">#read_data.a_412_b#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="33%"><font face="Arial, Helvetica, sans-serif" size="0.5">120.
                     GROSS AMOUNT DUE FROM BORROWER </font></td>
                  <td width="17%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;<b><font color="blue">#read_data.a_120#</font></b></font></div>
                  </td>
                  <td width="34%"><font face="Arial, Helvetica, sans-serif" size="0.5">420.
                     GROSS AMOUNT DUE TO SELLER </font></td>
                  <td width="16%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;<b><font color="blue">#read_data2.a_1400_b#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td colspan="2"><font face="Arial, Helvetica, sans-serif" size="0.5">200.
                     AMOUNTS PAID BY OR ON BEHALF OF BORROWER: </font> </td>
                  <td colspan="2"><font face="Arial, Helvetica, sans-serif" size="0.5">500.
                     REDUCTIONS IN AMOUNT DUE TO SELLER: </font></td>
               </tr>
               <tr valign="top">
                  <td width="33%"><font face="Arial, Helvetica, sans-serif" size="0.5">201.
                     Deposit or earnest money </font></td>
                  <td width="17%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;<b><font color="blue">#read_data.a_201#</font></b></font></div>
                  </td>
                  <td width="34%"><font face="Arial, Helvetica, sans-serif" size="0.5">501.
                     Excess deposit (see instructions) </font></td>
                  <td width="16%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;<b><font color="blue">#read_data.a_500#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="33%"><font face="Arial, Helvetica, sans-serif" size="0.5">202.
                     Principal amount of new loan(s) </font></td>
                  <td width="17%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;<b><font color="blue">#read_data.a_202#</font></b></font></div>
                  </td>
                  <td width="34%"><font face="Arial, Helvetica, sans-serif" size="0.5">502.
                     Settlement charges to seller (line 1400) </font></td>
                  <td width="16%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;<b><font color="blue">#read_data2.a_1400_b#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="33%"><font face="Arial, Helvetica, sans-serif" size="0.5">203.
                     Existing loan(s) taken subject to </font></td>
                  <td width="17%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;<b><font color="blue">#read_data.a_203#</font></b></font></div>
                  </td>
                  <td width="34%"><font face="Arial, Helvetica, sans-serif" size="0.5">503.
                     Existing loan(s) taken subject to </font></td>
                  <td width="16%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;<b><font color="blue">#read_data.a_503#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="33%"><font face="Arial, Helvetica, sans-serif" size="0.5">204.
                     #read_data.a_204_a#</font></td>
                  <td width="17%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;<b><font color="blue">#read_data.a_204_b#</font></b></font></div>
                  </td>
                  <td width="34%"><font face="Arial, Helvetica, sans-serif" size="0.5">504.
                     Payoff of First Mortgage Loan </font></td>
                  <td width="16%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;<b><font color="blue">#read_data.a_504#</font></b></font></div>
                  </td>
               </tr>
               <!-----<tr valign="top">
                  <td width="33%"><font face="Arial, Helvetica, sans-serif" size="0.5"></font></td>
                  <td width="17%">
                     <div align="right"><b><font face="Times New Roman, Times, serif" size="0.5" color="blue"><font face="Arial, Helvetica, sans-serif"><font face="Arial, Helvetica, sans-serif"><font size="0.5"></font></font></font></font></b></div>
                  </td>
                  <td width="34%"><font face="Arial, Helvetica, sans-serif" size="0.5"></font></td>
                  <td width="16%">
                     <div align="right"><font face="Times New Roman, Times, serif"><font face="Times New Roman, Times, serif"><font size="0.5"><font size="0.5"><font color="blue"><b><font face="Arial, Helvetica, sans-serif"><font face="Arial, Helvetica, sans-serif"><font size="0.5"></font></font></font></b></font></font></font></font></font></div>
                  </td>
               </tr>----->
               <tr valign="top">
                  <td width="33%"><font face="Arial, Helvetica, sans-serif" size="0.5">205.
                     #read_data.a_205_a#</font></td>
                  <td width="17%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;<b><font color="blue">#read_data.a_205_b#</font></b></font></div>
                  </td>
                  <td width="34%"><font face="Arial, Helvetica, sans-serif" size="0.5">505.
                     Payoff of Second Mortgage Loan </font></td>
                  <td width="16%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;<b><font color="blue">#read_data.a_505#</font></b></font></div>
                  </td>
               </tr>
              <!-----<tr valign="top">
                  <td width="33%"><font face="Arial, Helvetica, sans-serif" size="0.5"></font></td>
                  <td width="17%">
                     <div align="right"><b><font face="Times New Roman, Times, serif" size="0.5" color="blue"><font face="Arial, Helvetica, sans-serif"><font face="Arial, Helvetica, sans-serif"><font size="0.5"></font></font></font></font></b></div>
                  </td>
                  <td width="34%"><font face="Arial, Helvetica, sans-serif" size="0.5"></font></td>
                  <td width="16%">
                     <div align="right"><font face="Times New Roman, Times, serif"><font face="Times New Roman, Times, serif"><font size="0.5"><font size="0.5"><font color="blue"><b><font face="Arial, Helvetica, sans-serif"><font face="Arial, Helvetica, sans-serif"><font size="0.5"></font></font></font></b></font></font></font></font></font></div>
                  </td>
               </tr>----->
               <tr valign="top">
                  <td width="33%"><font face="Arial, Helvetica, sans-serif" size="0.5">206.
                     #read_data.a_206_a#</font></td>
                  <td width="17%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;<b><font color="blue">#read_data.a_206_b#</font></b></font></div>
                  </td>
                  <td width="34%"><font face="Arial, Helvetica, sans-serif" size="0.5">506.
                     #read_data.a_506_a#</font></td>
                  <td width="16%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;<b><font color="blue">#read_data.a_506_b#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="33%"><font face="Arial, Helvetica, sans-serif" size="0.5">207.
                     #read_data.a_207_a#</font></td>
                  <td width="17%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;<b><font color="blue">#read_data.a_207_b#</font></b></font></div>
                  </td>
                  <td width="34%"><font face="Arial, Helvetica, sans-serif" size="0.5">507.
                     #read_data.a_507_a#</font></td>
                  <td width="16%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;<b><font color="blue">#read_data.a_507_b#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="33%"><font face="Arial, Helvetica, sans-serif" size="0.5">208.
                     #read_data.a_208_a#</font></td>
                  <td width="17%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;<b><font color="blue">#read_data.a_208_b#</font></b></font></div>
                  </td>
                  <td width="34%"><font face="Arial, Helvetica, sans-serif" size="0.5">508.
                     #read_data.a_508_a#</font></td>
                  <td width="16%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;<b><font color="blue">#read_data.a_508_b#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="33%"><font face="Arial, Helvetica, sans-serif" size="0.5">209.
                     #read_data.a_209_a#</font></td>
                  <td width="17%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;<b><font color="blue">#read_data.a_209_b#</font></b></font></div>
                  </td>
                  <td width="34%"><font face="Arial, Helvetica, sans-serif" size="0.5">509.
                     #read_data.a_509_a#</font></td>
                  <td width="16%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;<b><font color="blue">#read_data.a_509_b#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td colspan="2">
                     <div align="center"><font face="Arial, Helvetica, sans-serif" size="0.5">Adjustments
                        for items unpaid by seller </font></div>
                  </td>
                  <td colspan="2">
                     <div align="center"><font face="Arial, Helvetica, sans-serif" size="0.5">
                        Adjustments for items unpaid by seller </font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="33%"><font face="Arial, Helvetica, sans-serif" size="0.5">210.
                     City / town taxes </font></td>
                  <td width="17%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;<b><font color="blue">#read_data.a_210#</font></b></font></div>
                  </td>
                  <td width="34%"><font face="Arial, Helvetica, sans-serif" size="0.5">510.
                     City / town taxes </font></td>
                  <td width="16%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;<b><font color="blue">#read_data.a_510#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="33%"><font face="Arial, Helvetica, sans-serif" size="0.5">211.
                     County Taxes </font></td>
                  <td width="17%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;<b><font color="blue">#read_data.a_211#</font></b></font></div>
                  </td>
                  <td width="34%"><font face="Arial, Helvetica, sans-serif" size="0.5">511.
                     County Taxes </font></td>
                  <td width="16%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;<b><font color="blue">#read_data.a_511#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="33%"><font face="Arial, Helvetica, sans-serif" size="0.5">212.
                     Assessments </font></td>
                  <td width="17%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;<b><font color="blue">#read_data.a_212#</font></b></font></div>
                  </td>
                  <td width="34%"><font face="Arial, Helvetica, sans-serif" size="0.5">512.
                     Assessments </font></td>
                  <td width="16%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;<b><font color="blue">#read_data.a_512#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="33%"><font face="Arial, Helvetica, sans-serif" size="0.5">213.
                     #read_data.a_213_a#</font></td>
                  <td width="17%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;<b><font color="blue">#read_data.a_213_b#</font></b></font></div>
                  </td>
                  <td width="34%"><font face="Arial, Helvetica, sans-serif" size="0.5">513.
                     #read_data.a_513_a#</font></td>
                  <td width="16%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;<b><font color="blue">#read_data.a_513_b#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="33%"><font face="Arial, Helvetica, sans-serif" size="0.5">214.
                     #read_data.a_214_a#</font></td>
                  <td width="17%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;<b><font color="blue">#read_data.a_214_b#</font></b></font></div>
                  </td>
                  <td width="34%"><font face="Arial, Helvetica, sans-serif" size="0.5">514.
                     #read_data.a_514_a#</font></td>
                  <td width="16%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;<b><font color="blue">#read_data.a_514_b#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="33%"><font face="Arial, Helvetica, sans-serif" size="0.5">215.
                     #read_data.a_215_a#</font></td>
                  <td width="17%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;<b><font color="blue">#read_data.a_215_b#</font></b></font></div>
                  </td>
                  <td width="34%"><font face="Arial, Helvetica, sans-serif" size="0.5">515.
                     #read_data.a_515_a#</font></td>
                  <td width="16%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;<b><font color="blue">#read_data.a_515_b#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="33%"><font face="Arial, Helvetica, sans-serif" size="0.5">216.
                     #read_data.a_216_a#</font></td>
                  <td width="17%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;<b><font color="blue">#read_data.a_216_b#</font></b></font></div>
                  </td>
                  <td width="34%"><font face="Arial, Helvetica, sans-serif" size="0.5">516.
                     #read_data.a_516_a#</font></td>
                  <td width="16%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;<b><font color="blue">#read_data.a_516_b#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="33%"><font face="Arial, Helvetica, sans-serif" size="0.5">217.
                     #read_data.a_217_a#</font></td>
                  <td width="17%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;<b><font color="blue">#read_data.a_217_b#</font></b></font></div>
                  </td>
                  <td width="34%"><font face="Arial, Helvetica, sans-serif" size="0.5">517.
                     #read_data.a_517_a#</font></td>
                  <td width="16%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;<b><font color="blue">#read_data.a_517_b#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="33%"><font face="Arial, Helvetica, sans-serif" size="0.5">218.
                     #read_data.a_218_a#</font></td>
                  <td width="17%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;<b><font color="blue">#read_data.a_218_b#</font></b></font></div>
                  </td>
                  <td width="34%"><font face="Arial, Helvetica, sans-serif" size="0.5">518.
                     #read_data.a_518_a#</font></td>
                  <td width="16%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;<b><font color="blue">#read_data.a_518_b#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="33%"><font face="Arial, Helvetica, sans-serif" size="0.5">219.
                     #read_data.a_219_a#</font></td>
                  <td width="17%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;<b><font color="blue">#read_data.a_219_b#</font></b></font></div>
                  </td>
                  <td width="34%"><font face="Arial, Helvetica, sans-serif" size="0.5">519.
                     #read_data.a_519_a#</font></td>
                  <td width="16%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;<b><font color="blue">#read_data.a_519_b#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="33%"><font face="Arial, Helvetica, sans-serif" size="0.5">220.
                     TOTAL PAID BY/FOR BORROWER </font></td>
                  <td width="17%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;<b><font color="blue">#read_data.a_220#</font></b></font></div>
                  </td>
                  <td width="34%"><font face="Arial, Helvetica, sans-serif" size="0.5">520.
                     TOTAL REDUCTION AMOUNT DUE SELLER</font></td>
                  <td width="16%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;<b><font color="blue">#read_data.a_520#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td colspan="2"><font face="Arial, Helvetica, sans-serif" size="0.5">300.
                     CASH AT SETTLEMENT FROM OR TO BORROWER: </font> </td>
                  <td colspan="2"><font face="Arial, Helvetica, sans-serif" size="0.5">600.
                     CASH AT SETTLEMENT TO OR FROM SELLER: </font></td>
               </tr>
               <tr valign="top">
                  <td width="33%"><font face="Arial, Helvetica, sans-serif" size="0.5">301.
                     Gross amount due from borrower (line 120) </font></td>
                  <td width="17%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;<b><font color="blue">#read_data.a_301#</font></b></font></div>
                  </td>
                  <td width="34%"><font face="Arial, Helvetica, sans-serif" size="0.5">601.
                     Gross amount due to seller (line 420) </font></td>
                  <td width="16%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;<b><font color="blue">#read_data.a_601#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="33%"><font face="Arial, Helvetica, sans-serif" size="0.5">302.
                     Less amounts paid by/for borrower (line 220) </font></td>
                  <td width="17%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;<b><font color="blue">#read_data.a_302#</font></b></font></div>
                  </td>
                  <td width="34%"><font face="Arial, Helvetica, sans-serif" size="0.5">602.
                     Less reduction amount due seller (line 520)</font></td>
                  <td width="16%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;<b><font color="blue">#read_data.a_602#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="33%"><br>
                     <font face="Arial, Helvetica, sans-serif" size="0.5">303. CASH
                     FROM BORROWER </font></td>
                  <td width="17%"><br>
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;<b><font color="blue">#read_data.a_303#</font></b></font></div>
                  </td>
                  <td width="34%"><br>
                     <font face="Arial, Helvetica, sans-serif" size="0.5">603. CASH
                     TO SELLER</font></td>
                  <td width="16%"><br>
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="0.5">&nbsp;<b><font color="blue">#read_data.a_603#</font></b></font></div>
                  </td>
               </tr>
            </table>
         </td>
      </tr>
      <tr>
         <td><br><font face="Arial, Helvetica, sans-serif" size="0.5"> SUBSTITUE FROM
            1099 SELLER STATEMENT: The information contained herein is important
            tax information and is being furnished to the Internal Revenue Service.
            If you are required to file a return, a negligence penalty or other
            sanction will be imposed on you if this item is required to be reported
            and the IRS determines that it has not been reported. The contract
            sales price described on line 401 above constitutes the gross proceeds
            of this transaction. </font></td>
      </tr>
      <tr>
         <td><br><font face="Arial, Helvetica, sans-serif" size="0.5">SELLER INSTRUCTIONS:
            If this real estate was your principal residence, file form 2119 ,
            Sale or Exchange of PRincipal Residence, for any gain, with your income
            tax return: for other transactions, complete the applicable parts
            of Form 4797, Form 6252 and/or Schedule D (Form 1040) </font></td>
      </tr>
      <tr>
         <td><br>
            <font face="Times New Roman, Times, serif" size="0.5">You are required
            by law to provide the settlement agent (Fed. Tax ID No: <B><font color="blue" size="0.5">#read_data.Fed_tax_id_no#</font></B>)
            with your correct taxpayer identification number. If you do not provide
            your correct taxpayer identification number, you may be subject to
            civil or criminal penalties imposed by law. Under penalties of purjury,
            I certify that the number shown on this statement is my correct taxpayer
            identification number.</font></td>
      </tr>
      <tr>
         <td><br>
            <font face="Arial, Helvetica, sans-serif" size="0.5">TIN: <B><font size="0.5" face="Times New Roman, Times, serif" color="blue">#read_data.Fed_tax_id_no#</font></B>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Seller(s)
            Signature(s)____________________________________________________</font></td>
      </tr>
      <tr>
         <td><br>
            <font face="Arial, Helvetica, sans-serif" size="0.5">SELLER(S) NEW MAILING
            ADDRESS: </font><B><font face="Times New Roman, Times, serif" size="0.5" color="blue">#read_data.seller_new_addr#</font></B></td>
      </tr>
      <tr>
         <td><br>
            <font face="Arial, Helvetica, sans-serif" size="0.5">SELLER(S)PHONE
            NUMBERS:(H) (W) &nbsp;&nbsp;<B><font color="blue" size="0.5" face="Times New Roman, Times, serif">#read_data.seller_new_home_phone#</font></B><font size="0.5">(H)</font>&nbsp;&nbsp;&nbsp;&nbsp;
            <B><font color="blue" size="0.5" face="Times New Roman, Times, serif">#read_data.seller_new_work_phone#</font></B><font size="0.5">(W)</font></font></td>
      </tr>
      <tr>
         <td></td>
      </tr>
   </table>
</CFOUTPUT>
<script type="text/javascript">



  var _gaq = _gaq || [];

  _gaq.push(['_setAccount', 'UA-195021-17']);

  _gaq.push(['_trackPageview']);



  (function() {

    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;

    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'https://www') + '.google-analytics.com/ga.js';

    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);

  })();



</script>

</body>
</html>
