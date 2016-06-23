<cfparam name="al" default="0">

<cffunction name="FixDecimals" >
	<cfargument name="input_num">
	<cfif IsNumeric(arguments.input_num)>
		<cfset new_num = NumberFormat(arguments.input_num, "_,___,___,___.__")>
	<cfelse>
		<cfset new_num = arguments.input_num>
	</cfif>
	<cfif arguments.input_num eq 0>
		<cfset new_num = "">
	</cfif>
	<cfreturn new_num>
</cffunction>


<cfparam name="a_trigger" default="0">
<cfparam name="uid" default="">
<cfparam name="lo_id" default="">

<html>
<head>
<title></title>
 <HTML XMLNS:IE>
<HEAD>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="links.css" type="text/css">
<style media="print">
.noprint     { display: none }
</style>



</HEAD>




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
<CFQUERY datasource="#request.dsn#" NAME="get_comp_info">
			SELECT *
			FROM Companies
			WHERE ID = #get_titleid.comp_id#
		</CFQUERY>

<cfif get_comp_info.id eq 2632 or get_comp_info.master_co_id eq 2632>
<cfset title_co_name = "Axiom Title">
<cfelse>
<cfset title_co_name = "First Title">
</cfif>

<CFQUERY datasource="#request.dsn#" NAME="get_insurance">
				SELECT * from Doc_Title_Insurance_Title
				where Title_ID = #rec_id#

			</CFQUERY>
			<cfif #get_insurance.recordcount# GT 0>
			<CFQUERY datasource="#request.dsn#" NAME="get_ins">
				SELECT * from title_companies
				where Title_co_ID = '#get_insurance.insurance_co#'

			</CFQUERY>
			<cfelse>
			<CFQUERY datasource="#request.dsn#" NAME="get_ins">
				SELECT * from title_companies
				where 0 = 1

			</CFQUERY>
			</cfif>
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
<cfset #read_agency.TITLE_FT_AGENCY_NAME# = "Agency N/A">
<cfset #get_line_costs.A_1111_TEXT# = "">
<cfset #get_line_costs.A_1112_TEXT# = "">
<cfset #get_line_costs.A_1113_TEXT# = "">
<cfset #get_line_costs.A_1113_TEXT# = "">
<cfset #get_line_costs.A_1205_TEXT# = "">
<cfset #get_line_costs.A_1303_TEXT# = "">
<cfset #get_line_costs.A_1304_TEXT# = "">
<cfset #get_line_costs.A_1305_TEXT# = "">
</cfif>
  <cfif #a_trigger# eq 2>
<CFQUERY datasource="#request.dsn#">
		update hud_form_title_pg2
		set print_date = '#DateFormat(Now(), "mmmmm dd, yyyy")#'
		WHERE Title_ID = #rec_id#

</CFQUERY>	</cfif>
<cfif #a_trigger# eq 23>

<cfif #get_titleid.loan_number# neq "">

   <cfset loan_number=", Loan No. -"&#get_titleid.loan_number#>
	 <cfelse>
	  <cfset loan_number="">
</cfif>

	<!---  nelli@firsttitleservices.com got rid <cfif #get_titleid.loan_number# neq "">, Loan No. - #get_titleid.loan_number#</cfif>--->
<CFMAIL
TO="#email#"
FROM="hudprep@firsttitleservices.com"
SERVER="127.0.0.1"
Subject="First Title - PRE HUD1 for order #rec_id# - #get_titleid.bfirstname1# #get_titleid.blastname1# #loan_number#"
TIMEOUT="600"
type="HTML"
>

View/Print <A HREF="https://#cgi.server_name#/title_view_hud_pg1.cfm?comp_id=115&user_id_1=723&lo_id=1217&rec_id=#rec_id#&a_trigger=1&company_id=0" target="new">HUD1</a> for order #rec_id#  - #get_titleid.bfirstname1# #get_titleid.blastname1#</B></font><br><br>

First Title staff
</cfmail>
</cfif>
<BODY TEXT="#000000" LINK="#FF0000" VLINK="#800000" ALINK="#FF00FF" marginheight=0 marginwidth=0 topmargin=0 leftmargin=0>
<!---
I changed this next line to what is currently there now
codebase="https://www.meadroid.com/scriptx/ScriptX.cab#Version=6,1,429,14"
<object id=idPDF width=50% height=50%
classid="clsid:CA8A9780-280D-11CF-A24D-444553540000">
  <param name="src" value="https://#cgi.server_name#/title_view_hud_pg1.cfm">
</object>
 --->


 <!--- factory.printing.Print(false,window)

 function Print() {
  factory.printing.Print(false); // no prompt
}
idPrint.disabled = false;

function PrintPDF(url) {
  factory.printing.PrintPDF(idPDF);
} --->


<table align="center" width="98%" cellspacing=0 cellpadding=0>
     <CFQUERY datasource="#request.dsn#" NAME="read_mods">
			Select * from hud_modify
			WHERE title_id = #rec_id# and modification_text is not null order by c_date, c_time
	</cfquery>





<!--- <a href="#" onclick=printWindow();><input disabled type="button" value="Print the page"></a>
</div> --->
<CFOUTPUT>
<table align="center" width="98%" cellspacing=0 cellpadding=0>
   <tr>
      <td width="56%"><b><font face="Arial, Helvetica, sans-serif" size="1">A.
         </font><font face="Arial, Helvetica, sans-serif">Settlement Statement</font></b></td>
      <td  width="44%"><font face="Arial, Helvetica, sans-serif" size="1">US Department
         of Housing</font></td>
   </tr>
   <tr>
      <td width="56%"><font face="Arial, Helvetica, sans-serif" size="1">B. Type
         of Loan</font></td>
      <td width="44%"><font face="Arial, Helvetica, sans-serif" size="1">and Urban
         Development OMB No. 2502-0265</font></td>
   </tr>
</table>
   <table border="1" cellspacing=0 cellpadding=0 align = "center" width="98%" bordercolordark="666666" bordercolorlight="666666" bordercolor="666666">
      <tr>
         <td align="center">
            <table align="center" width="100%" cellspacing=0 cellpadding=0 border="1">
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">1.
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
                  <td width="17%"><font face="Arial, Helvetica, sans-serif" size="1">
                     6. File Number<br>
                     <b><font face="Arial, Helvetica, sans-serif" size="1" color="blue"><cfif get_titleid.comp_id eq 3943 or get_titleid.comp_id eq 4042 or get_titleid.comp_id eq 4043>#get_titleid.title_id#<cfelse>#read_data.a_6#</cfif></font></b></font></td>
                  <td width="19%"><font face="Arial, Helvetica, sans-serif" size="1">7.
                     Loan Number<br>
                     <b><font face="Arial, Helvetica, sans-serif" size="1" color="blue">#get_titleid.loan_number#</font></b></font></td>
                  <td width="27%"><font face="Arial, Helvetica, sans-serif" size="1">8.
                     Mortgage Insurance Case Number<br>
                     <b><font face="Arial, Helvetica, sans-serif" size="1" color="blue">#read_data.a_8#</font></b></font></td>
               </tr>
            </table>
         </td>
      </tr>
      <tr>
         <td align="center">
            <table align="center" cellspacing=0 cellpadding=0 width="100%">
               <tr valign="top">
                  <td width="43"><font face="Arial, Helvetica, sans-serif" size="1">
                     C. Note: </font></td>
                  <td width="671"><font face="Arial, Helvetica, sans-serif" size="1">This
                     form is furnished to give you a statement of the actual settlement
                     costs. Amounts paid by and to the settlement agent are shown.
                     Items marked "(p.o.c)" were paid outside the closing; they
                     are shown here for information purposes and are not included
                     in the totals. WARNING: It is a crime to knowingly make
                     false statements to the United States on this or any other
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
            <td width="24%"><font size="1" face="Arial, Helvetica, sans-serif">D.
              NAME OF BORROWER:</font></td>
            <td><b><font face="Arial, Helvetica, sans-serif" size="1" color="blue"><cfif get_titleid.comp_id eq 3943 or get_titleid.comp_id eq 4043 or get_titleid.comp_id eq 4042>#get_titleid.full_vesting#<cfelse><cfif get_titleid.company1 neq '' and get_titleid.company1 neq 'NULL'>#get_titleid.company1#<cfelse><cfif get_titleid.bfirstname1 neq '' and get_titleid.bfirstname1 neq 'NULL'>#get_titleid.bfirstname1#</cfif> <cfif get_titleid.bminame1 neq '' and get_titleid.bminame1 neq 'NULL'>#get_titleid.bminame1#.</cfif> <cfif get_titleid.blastname1 neq '' and get_titleid.blastname1 neq 'NULL'>#get_titleid.blastname1#</cfif><cfif get_titleid.bfirstname2 neq '' and get_titleid.bfirstname2 neq 'NULL'> and #get_titleid.bfirstname2#</cfif> <cfif get_titleid.bminame2 neq '' and get_titleid.bminame2 neq 'NULL'>#get_titleid.bminame2#.</cfif> <cfif get_titleid.blastname2 neq '' and get_titleid.blastname2 neq 'NULL'>#get_titleid.blastname2#</cfif> <cfif get_titleid.bfirstname3 neq '' and get_titleid.bfirstname3 neq 'NULL'> and #get_titleid.bfirstname3#</cfif> <cfif get_titleid.bminame3 neq '' and get_titleid.bminame3 neq 'NULL'>#get_titleid.bminame3#.</cfif> <cfif get_titleid.blastname3 neq '' and get_titleid.blastname3 neq 'NULL'>#get_titleid.blastname3#</cfif><cfif get_titleid.bfirstname4 neq '' and get_titleid.bfirstname4 neq 'NULL'> and #get_titleid.bfirstname4#</cfif> <cfif get_titleid.bminame4 neq '' and get_titleid.bminame4 neq 'NULL'>#get_titleid.bminame4#.</cfif> <cfif get_titleid.blastname4 neq '' and get_titleid.blastname4 neq 'NULL'>#get_titleid.blastname4#</cfif> <cfif (get_titleid.manner_of_title neq '' and get_titleid.manner_of_title neq 'NULL')>(#get_titleid.manner_of_title#)</cfif></cfif></cfif></font></b></td>
          </tr>
          <tr valign="top">
            <td width="24%"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;&nbsp;&nbsp;ADDRESS:</font></td>
            <td width="76%"><b><font face="Arial, Helvetica, sans-serif" size="1" color="blue"><cfif get_titleid.mailing_address neq '' and get_titleid.mailing_address neq 'NULL'>#get_titleid.mailing_address#<cfelse>#read_data.g_propaddr#</cfif></font></b></td>
          </tr>
        </table>
         </td>
      </tr>
      <tr>
         <td align="center" height="30">
            <table align="center" cellspacing=0 cellpadding=0 width="100%">
               <tr valign="top">
                  <td width="24%"><font face="Arial, Helvetica, sans-serif" size="1">E.
                     NAME OF SELLER:</font></td>
                  <td width="76%"><b><font face="Arial, Helvetica, sans-serif" size="1" color="blue"><cfif get_titleid.company2 neq '' and get_titleid.company2 neq 'NULL'>#get_titleid.company2#<cfelse><cfif get_titleid.comp_id eq 3943 or get_titleid.comp_id eq 4042 or get_titleid.comp_id eq 4043 and read_data2.a_1114_a neq '' and read_data2.a_1114_a neq 'NULL'><cfif get_titleid.sfirstname1 neq '' and get_titleid.sfirstname1 neq 'NULL'>#get_titleid.sfirstname1#</cfif> <cfif get_titleid.sminame1 neq '' and get_titleid.sminame1 neq 'NULL'>#get_titleid.sminame1#.</cfif> <cfif get_titleid.slastname1 neq '' and get_titleid.slastname1 neq 'NULL'>#get_titleid.slastname1#</cfif><cfif get_titleid.sfirstname2 neq '' and get_titleid.sfirstname2 neq 'NULL'> and #get_titleid.sfirstname2#</cfif> <cfif get_titleid.sminame2 neq '' and get_titleid.sminame2 neq 'NULL'>#get_titleid.sminame2#.</cfif> <cfif get_titleid.slastname2 neq '' and get_titleid.slastname2 neq 'NULL'>#get_titleid.slastname2#</cfif> <cfif get_titleid.sfirstname3 neq '' and get_titleid.sfirstname3 neq 'NULL'> and #get_titleid.sfirstname3#</cfif> <cfif get_titleid.sminame3 neq '' and get_titleid.sminame3 neq 'NULL'>#get_titleid.sminame3#.</cfif> <cfif get_titleid.slastname3 neq '' and get_titleid.slastname3 neq 'NULL'>#get_titleid.slastname3#</cfif><cfelseif get_titleid.comp_id neq 3276>#read_data.e_sname#</cfif></cfif></font></b></td>
               </tr>
               <tr valign="top">
                  <td width="24%"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;&nbsp;&nbsp;&nbsp;ADDRESS:</font></td>
                  <td width="76%"><b><font face="Arial, Helvetica, sans-serif" size="1" color="blue"><cfif get_titleid.company2 neq '' and get_titleid.company2 neq 'NULL'>#get_titleid.company2addr#<cfelse>#read_data.e_saddr#</cfif></font></b></td>
               </tr>
            </table>
         </td>
      </tr>
      <tr>
         <td align="center">
            <table align="center" cellspacing=0 cellpadding=0 width="100%">
               <tr valign="top">
                  <td width="24%"><font face="Arial, Helvetica, sans-serif" size="1">F.
                     NAME OF LENDER:</font></td>
                  <td width="76%"><b><font face="Arial, Helvetica, sans-serif" size="1" color="blue">#read_data.f_lname#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_titleid.insured#</font></b></td>
               </tr>
               <tr valign="top">
                  <td width="24%"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;&nbsp;&nbsp;&nbsp;ADDRESS:</font></td>
                  <td width="76%"><b><font face="Arial, Helvetica, sans-serif" size="1" color="blue">#read_data.f_laddr#</font></b></td>
               </tr>
            </table>
         </td>
      </tr>
      <tr>
         <td align="center">
            <table align="center" cellspacing=0 cellpadding=0 width="100%">
               <tr valign="top">
                  <td width="24%"><font face="Arial, Helvetica, sans-serif" size="1">G.
                     PROPERTY ADDRESS:</font></td>
                  <td width="76%"><b><font face="Arial, Helvetica, sans-serif" size="1" color="blue"><cfif get_titleid.comp_id eq 3276 or get_titleid.comp_id eq 3943 or get_titleid.comp_id eq 4043 or get_titleid.comp_id eq 4042>#ReplaceNoCase(get_titleid.paddress, ", ", ", Unit ", "ALL")#, #get_titleid.pcity#, #get_titleid.pstate# #get_titleid.pzip# #get_titleid.pcounty#<cfelse>#read_data.g_propaddr#</cfif></font></b></td>
               </tr>
            </table>
         </td>
      </tr>
      <tr>
         <td align="center">
            <table align="center" cellspacing=0 cellpadding=0 width="100%">
               <tr valign="top">
                  <td width="24%"><font face="Arial, Helvetica, sans-serif" size="1">H.
                     SETTLEMENT AGENT:</font></td>
                  <td width="76%"><b><font face="Arial, Helvetica, sans-serif" size="1" color="blue">#read_agency.title_FT_Agency_name#</font></b></td>
               </tr>
               <tr valign="top">
                  <td width="24%"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;&nbsp;&nbsp;&nbsp;PLACE
                     OF SETTLEMENT:</font></td>
                  <td width="76%"><b><font face="Arial, Helvetica, sans-serif" size="1" color="blue"><cfif get_comp_info.id eq 2632 or get_comp_info.master_co_id eq 2632>
				  3926 Pender Drive, 1st Floor, Fairfax, VA 22030
				  <cfelse>
<cfif NOT DateDiff("d", Now(), "1/30/2012")>
30 W. Gude Dr. Rockville, MD. 20850 - Montgomery County
<cfelse>
7361 Calhoun Place, Suite 200, Rockville, MD. 20855 - Montgomery County
</cfif>



				  </cfif></font></b></td>
               </tr>
            </table>
         </td>
      </tr>
      <tr>
         <td align="center">
            <table align="center" cellspacing=0 cellpadding=0 width="100%">
               <tr valign="top">
                  <td width="24%"><font face="Arial, Helvetica, sans-serif" size="1">I.
                     SETTLEMENT DATE:</font></td>
                  <td><b><font face="Arial, Helvetica, sans-serif" size="1" color="blue"><cfif get_titleid.comp_id neq 3276>#read_data.i_settlementDate#</cfif></font></b></td>
                   <td><font face="Arial, Helvetica, sans-serif" size="1">
                     DISBURSEMENT DATE:</font></td>
                  <td><b><font face="Arial, Helvetica, sans-serif" size="1" color="blue"><cfif get_titleid.comp_id neq 3276>&nbsp;&nbsp;#read_data.dis_date#</cfif></font></b></td>
               </tr>
            </table>
         </td>
      </tr>
      <tr>
         <td align="center">
            <table align="center" cellspacing=0 cellpadding=0 width="100%" border="1">
               <tr valign="top" align="center">
                  <td colspan="2"><font face="Arial, Helvetica, sans-serif" size="1"><b>J.
                     SUMMARY OF BORROWERS TRANSACTIONS:</b></font></td>
                  <td colspan="2"><font face="Arial, Helvetica, sans-serif" size="1"><b>K.
                     SUMMARY OF SELLERS TRANSACTIONS:</b></font></td>
               </tr>
               <tr valign="top">
                  <td colspan="2"><font face="Arial, Helvetica, sans-serif" size="1">100.
                     GROSS AMOUNT DUE FROM BORROWER</font></td>
                  <td colspan="2"><font face="Arial, Helvetica, sans-serif" size="1">400.
                     GROSS AMOUNT DUE TO SELLER: </font></td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">101.
                     Contract Sales Price </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue"><cfif get_titleid.comp_id neq 3276 and get_titleid.comp_id neq 3943 and get_titleid.comp_id neq 4043 and get_titleid.comp_id neq 4042>#FixDecimals(get_titleid.purchase)#</cfif><cfif (get_titleid.comp_id eq 3943 or get_titleid.comp_id eq 4042 or get_titleid.comp_id eq 4043) and (get_titleid.searchtype neq 'Refinance' and get_titleid.slastname1 neq '' and get_titleid.slastname1 neq 'NULL')>#FixDecimals(get_titleid.purchase)#</cfif></font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">401.
                     Contract Sales Price </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_401)#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">102.
                  <cfif read_data.a_102_text neq '' and read_data.a_102_text neq 'NULL'>#read_data.a_102_text#<cfelse>   Personal Property</cfif> </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_102)#</font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">402.
                     Personal Property </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_402)#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">103.
                     Settlement charges to buyer (line 1400) </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_103)#</font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">403.
                     #read_data.a_403_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_403_b)#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">104.
                     #read_data.a_104_a# </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_104_b)#</font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">404.
                     #read_data.a_404_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_404_b)#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">105.
                     <cfif get_titleid.comp_id eq 3943  or get_titleid.comp_id eq 4042 or get_titleid.comp_id eq 4043 and get_titleid.prepay_penalty neq ''>#get_titleid.prepay_penalty_text#<cfelse>#read_data.a_105_a#</cfif> </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue"><cfif get_titleid.comp_id eq 3943  or get_titleid.comp_id eq 4042 or get_titleid.comp_id eq 4043 and get_titleid.prepay_penalty neq ''>#FixDecimals(get_titleid.prepay_penalty)#<cfelse>#FixDecimals(read_data.a_105_b)#</cfif></font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">405.
                     #read_data.a_405_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_405_b)#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
<cfif get_titleid.comp_id eq 3276>
			   <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">106.
                     #get_titleid.prepay_penalty_text# </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_106)#</font></b></font></div>
                  </td>
			   <cfelse>
                  <td colspan="2" align="center"><font face="Arial, Helvetica, sans-serif" size="1">Adjustments
                     for items paid by seller in advance </font></td>
					 </cfif>                  <td colspan="2">
                     <div align="center"><font face="Arial, Helvetica, sans-serif" size="1">Adjustments
                        for items paid by seller in advance </font></div>
                  </td>
               </tr>
               <tr valign="top">
<cfif get_titleid.comp_id eq 3276>
			   <td colspan="2" align="center"><font face="Arial, Helvetica, sans-serif" size="1">Adjustments
                     for items paid by seller in advance </font></td>
			   <cfelse>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">106.
                     City / town taxes </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_106)#</font></b></font></div>
                  </td>
				  </cfif>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">406.
                     City / town taxes </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_406)#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">107.
                     County Taxes </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue"><B>#FixDecimals(read_data.a_107)#</B></font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">407.
                     County Taxes </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_407)#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">108.
                     Assessments </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue"><B>#FixDecimals(read_data.a_108)#</B></font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">408.
                     Assessments </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_408)#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">109.
                     #read_data.a_109_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_109_b)#</font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">409.
                     #read_data.a_409_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_409_b)#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">110.
                     #read_data.a_110_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_110_b)#</font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">410.
                     #read_data.a_410_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_410_b)#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">111.
                     #read_data.a_111_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_111_b)#</font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">411.
                     #read_data.a_411_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_411_b)#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">112.
                     #read_data.a_112_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_112_b)#</font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">412.
                     #read_data.a_412_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_412_b)#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">120.
                     GROSS AMOUNT DUE FROM BORROWER </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue"><cfif get_titleid.comp_id eq 3276><cfif IsNumeric(get_titleid.purchase)><cfset read_data.a_120 = read_data.a_120 - get_titleid.purchase></cfif><cfset read_data.a_301 = read_data.a_120></cfif>#FixDecimals(read_data.a_120)#</font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">420.
                     GROSS AMOUNT DUE TO SELLER </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data2.a_1400_b)#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td colspan="2"><font face="Arial, Helvetica, sans-serif" size="1">200.
                     AMOUNTS PAID BY OR ON BEHALF OF BORROWER: </font> </td>
                  <td colspan="2"><font face="Arial, Helvetica, sans-serif" size="1">500.
                     REDUCTIONS IN AMOUNT DUE TO SELLER: </font></td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">201.
                     Deposit or earnest money </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_201)#</font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">501.
                     Excess deposit (see instructions) </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_501)#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">202.
                     Principal amount of new loan(s) </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(get_titleid.loanamt_float)#</font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">502.
                     Settlement charges to seller (line 1400) </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data2.a_1400_b)#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">203.
                     Existing loan(s) taken subject to </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_203)#</font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">503.
                     Existing loan(s) taken subject to </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_503)#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">204.
                     #read_data.a_204_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_204_b)#</font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">504.
                     Payoff of First Mortgage Loan </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_504)#</font></b></font></div>
                  </td>
               </tr>
               <!-----<tr valign="top">
                  <td width="33%"><font face="Arial, Helvetica, sans-serif" size="1"></font></td>
                  <td width="17%">
                     <div align="right"><b><font face="Arial, Helvetica, sans-serif" size="1" color="blue"><font face="Arial, Helvetica, sans-serif"><font face="Arial, Helvetica, sans-serif"><font size="1"></font></font></font></font></b></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1"></font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif"><font face="Arial, Helvetica, sans-serif"><font size="1"><font size="1"><font color="blue"><b><font face="Arial, Helvetica, sans-serif"><font face="Arial, Helvetica, sans-serif"><font size="1"></font></font></font></b></font></font></font></font></font></div>
                  </td>
               </tr>----->
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">205.
                     #read_data.a_205_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_205_b)#</font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">505.
                     Payoff of Second Mortgage Loan </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_505)#</font></b></font></div>
                  </td>
               </tr>
              <!-----<tr valign="top">
                  <td width="33%"><font face="Arial, Helvetica, sans-serif" size="1"></font></td>
                  <td width="17%">
                     <div align="right"><b><font face="Arial, Helvetica, sans-serif" size="1" color="blue"><font face="Arial, Helvetica, sans-serif"><font face="Arial, Helvetica, sans-serif"><font size="1"></font></font></font></font></b></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1"></font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif"><font face="Arial, Helvetica, sans-serif"><font size="1"><font size="1"><font color="blue"><b><font face="Arial, Helvetica, sans-serif"><font face="Arial, Helvetica, sans-serif"><font size="1"></font></font></font></b></font></font></font></font></font></div>
                  </td>
               </tr>----->
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">206.
                     #read_data.a_206_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_206_b)#</font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">506.
                     #read_data.a_506_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_506_b)#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">207.
                     #read_data.a_207_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_207_b)#</font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">507.
                     #read_data.a_507_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_507_b)#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">208.
                     #read_data.a_208_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_208_b)#</font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">508.
                     #read_data.a_508_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_508_b)#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">209.
                     #read_data.a_209_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_209_b)#</font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">509.
                     #read_data.a_509_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_509_b)#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td colspan="2">
                     <div align="center"><font face="Arial, Helvetica, sans-serif" size="1">Adjustments
                        for items unpaid by seller </font></div>
                  </td>
                  <td colspan="2">
                     <div align="center"><font face="Arial, Helvetica, sans-serif" size="1">
                        Adjustments for items unpaid by seller </font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">210.
                     City / town taxes </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_210)#</font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">510.
                     City / town taxes </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_510)#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">211.
                     County Taxes </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_211)#</font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">511.
                     County Taxes </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_511)#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">212.
                     Assessments </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_212)#</font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">512.
                     Assessments </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_512)#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">213.
                     #read_data.a_213_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_213_b)#</font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">513.
                     #read_data.a_513_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_513_b)#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">214.
                     #read_data.a_214_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_214_b)#</font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">514.
                     #read_data.a_514_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_514_b)#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">215.
                     #read_data.a_215_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_215_b)#</font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">515.
                     #read_data.a_515_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_515_b)#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">216.
                     #read_data.a_216_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_216_b)#</font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">516.
                     #read_data.a_516_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_516_b)#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">217.
                     #read_data.a_217_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_217_b)#</font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">517.
                     #read_data.a_517_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_517_b)#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">218.
                     #read_data.a_218_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_218_b)#</font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">518.
                     #read_data.a_518_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_518_b)#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">219.
                     #read_data.a_219_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_219_b)#</font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">519.
                     #read_data.a_519_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_519_b)#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">220.
                     TOTAL PAID BY/FOR BORROWER </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_220)#</font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">520.
                     TOTAL REDUCTION AMOUNT DUE SELLER</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_520)#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td colspan="2"><font face="Arial, Helvetica, sans-serif" size="1">300.
                     CASH AT SETTLEMENT FROM OR TO BORROWER: </font> </td>
                  <td colspan="2"><font face="Arial, Helvetica, sans-serif" size="1">600.
                     CASH AT SETTLEMENT TO OR FROM SELLER: </font></td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">301.
                     Gross amount due from borrower (line 120) </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_301)#</font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">601.
                     Gross amount due to seller (line 420) </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_601)#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">302.
                     Less amounts paid by/for borrower (line 220) </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_302)#</font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">602.
                     Less reduction amount due seller (line 520)</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_602)#</font></b></font></div>
                  </td>
               </tr>
			   <cfif get_titleid.comp_id eq 3276>
			   <cfset read_data.a_303 = read_data.a_301 - read_data.a_302>
			   </cfif>
               <tr valign="top">
                  <td width="37%"><br>
                     <font face="Arial, Helvetica, sans-serif" size="1">303. CASH
                     <cfif read_data.a_303 LT 0>TO<cfelse>FROM</cfif> BORROWER </font></td>
                  <td width="13%"><br>
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue"><cfif read_data.a_303 LT 0>#ReplaceNoCase(FixDecimals(read_data.a_303), "-", "")#<cfelse>#FixDecimals(read_data.a_303)#</cfif></font></b></font></div>
                  </td>
                  <td width="37%"><br>
                     <font face="Arial, Helvetica, sans-serif" size="1">603. CASH
                     TO SELLER</font></td>
                  <td width="13%"><br>
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_603)#</font></b></font></div>
                  </td>
               </tr>
            </table>
         </td>
      </tr>

      <tr>
         <td ><br><font face="Arial, Helvetica, sans-serif" size="1"> SUBSTITUE FROM
            1099 SELLER STATEMENT: The information contained herein is important
            tax information and is being furnished to the Internal Revenue Service.
            If you are required to file a return, a negligence penalty or other
            sanction will be imposed on you if this item is required to be reported
            and the IRS determines that it has not been reported. The contract
            sales price described on line 401 above constitutes the gross proceeds
            of this transaction. </font></td>
      </tr>
      <tr>
         <td ><br><font face="Arial, Helvetica, sans-serif" size="1">SELLER INSTRUCTIONS:
            If this real estate was your principal residence, file form 2119 ,
            Sale or Exchange of PRincipal Residence, for any gain, with your income
            tax return: for other transactions, complete the applicable parts
            of Form 4797, Form 6252 and/or Schedule D (Form 1040) </font></td>
      </tr>
      <tr>
         <td ><br>
            <font face="Arial, Helvetica, sans-serif" size="1">You are required
            by law to provide the settlement agent (Fed. Tax ID No: <B><font color="blue" size="1">#read_data.Fed_tax_id_no#</font></B>)
            with your correct taxpayer identification number. If you do not provide
            your correct taxpayer identification number, you may be subject to
            civil or criminal penalties imposed by law. Under penalties of purjury,
            I certify that the number shown on this statement is my correct taxpayer
            identification number.</font></td>
      </tr>
      <tr>
         <td ><br>
            <font face="Arial, Helvetica, sans-serif" size="1">TIN: <B><font size="1" face="Arial, Helvetica, sans-serif" color="blue">#read_data.Fed_tax_id_no#</font></B>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Seller(s)
            Signature(s)____________________________________________________</font></td>
      </tr>
      <tr>
         <td ><br>
            <font face="Arial, Helvetica, sans-serif" size="1">SELLER(S) NEW MAILING
            ADDRESS: </font><B><font face="Arial, Helvetica, sans-serif" size="1" color="blue">#read_data.seller_new_addr#</font></B></td>
      </tr>
      <tr>
         <td ><br>
            <font face="Arial, Helvetica, sans-serif" size="1">SELLER(S)PHONE
            NUMBERS:(H) (W) &nbsp;&nbsp;<B><font color="blue" size="1" face="Arial, Helvetica, sans-serif">#read_data.seller_new_home_phone#</font></B><font size="1">(H)</font>&nbsp;&nbsp;&nbsp;&nbsp;
            <B><font color="blue" size="1" face="Arial, Helvetica, sans-serif">#read_data.seller_new_work_phone#</font></B><font size="1">(W)</font></font></td>
      </tr>
      <tr>
         <td ></td>
      </tr>

   </table>

   <!--------end of first page-------->

 <p>&nbsp;</p> <p>&nbsp;</p><p>&nbsp;</p><p><br>
 <p><hr size="1" color="dimgray" width="98%"></p>
<p>&nbsp;</p>

  <table border="1" cellspacing=0 cellpadding=0 align = "center" width="98%" bordercolordark="666666" bordercolorlight="666666" bordercolor="666666">
<tr><td colspan="3">
  <table align="center" width="100%">
    <tr>
      <td width="56%"><div align="center"><b><font face="Arial, Helvetica, sans-serif" size="1">U.S.
          DEPARTMENT OF HOUSING AND URBAN DEVELOPMENT</font></b></div></td>
      <td  width="44%"><font face="Arial, Helvetica, sans-serif" size="1">File
        Number: <b>#read_data2.title_id#</b></font></td>
    </tr>
    <tr>
      <td width="56%"><div align="center"><b><font face="Arial, Helvetica, sans-serif" size="2">SETTLEMENT
          STATEMENT</font></b></div></td>
      <td  width="44%"><font face="Arial, Helvetica, sans-serif" size="1">PAGE
        2</font> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <font face="Arial, Helvetica, sans-serif" size="1">FINAL</font>
      </td>
    </tr>
  </table>
</td>
</tr>
    <tr>
      <td width="70%"><font size="1" face="Arial, Helvetica, sans-serif">L. SETTLEMENT CHARGES</font></td>
         <td width="15%" rowspan="5" align="center"><font size="1" face="Arial, Helvetica, sans-serif">PAID
            FROM BORROWERS FUNDS AT SETTLEMENT</font></td>
         <td width="15%" rowspan="5" align="center"><font size="1" face="Arial, Helvetica, sans-serif">PAID
            FROM SELLERS FUNDS AT SETTLEMENT</font></td>
    </tr>
    <tr>
      <td><font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif">700. TOTAL SALES/BROKER'S COMMISSION based on price &nbsp;&nbsp;&nbsp;&nbsp;$
        <b>#FixDecimals(read_data2.a_700_a)#</b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;@&nbsp;&nbsp;&nbsp;
        <b>#FixDecimals(read_data2.a_700_b)#</b> <b>#read_data2.a_700_c#</b></font></td>
    </tr>
    <tr>
      <td><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Division
        of commission (line 700) as follows:</font></td>
    </tr>
    <tr>
      <td><font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=black face="Arial, Helvetica, sans-serif">701. &nbsp;&nbsp;$<font color=blue><b>#FixDecimals(read_data2.a_701_a)#</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font>to
        <font color=blue> <b>#read_data2.a_701_b#</b></font></font></td>
    </tr>
    <tr>
      <td><font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=black face="Arial, Helvetica, sans-serif">702. &nbsp;&nbsp;$<font color=blue> <b>#FixDecimals(read_data2.a_702_a)#</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font>to
        <font color=blue> <b>#read_data2.a_702_b#</b></font></font></td>
    </tr>
    <tr>
      <td> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=black face="Arial, Helvetica, sans-serif">703. Commission paid at settlement </font></td>
      <td align="right"> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=blue face="Arial, Helvetica, sans-serif">
        &nbsp;<b>#FixDecimals(read_data2.a_703_a)#</b> </font></td>
      <td align="right"> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=blue face="Arial, Helvetica, sans-serif">
        &nbsp;<b>#FixDecimals(read_data2.a_703_b)#</b> </font></td>
    </tr>
    <tr>
      <td colspan=3> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=black face="Arial, Helvetica, sans-serif">800. ITEMS PAYABLE IN CONNECTION WITH LOAN </font></td>
    </tr>
    <tr>
      <td> <font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=black face="Arial, Helvetica, sans-serif">
            801. Loan Origination Fee&nbsp;&nbsp;<b>#FixDecimals(read_data2.a_801_a)#</b>%
            <font color=blue>&nbsp;&nbsp;
            <b>#FixDecimals(read_data2.a_801_d)#</b>
            </font>
            </font>
      </td>
      <td align="right">
        <font size="1" face="Arial, Helvetica, sans-serif">
        <font size=1 color=blue face="Arial, Helvetica, sans-serif">
        &nbsp;<b>#FixDecimals(read_data2.a_801_b)#</b> </font>
      </td>
      <td align="right"> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=blue face="Arial, Helvetica, sans-serif">
        &nbsp;<b>#FixDecimals(read_data2.a_801_c)#</b> </font></td>
    </tr>
    <tr>
      <td>
            <font size="1" face="Arial, Helvetica, sans-serif">
            <font size="1" face="Arial, Helvetica, sans-serif">
            <font size=1 color=black face="Arial, Helvetica, sans-serif">
            802. Loan Discount &nbsp;&nbsp;<b>#FixDecimals(read_data2.a_802_a)#</b>%
            <font color=blue>&nbsp;&nbsp;
            <b>#FixDecimals(read_data2.a_802_d)#</b>
            </font>
            </font>
      </td>
      <td align="right">
            <font size="1" face="Arial, Helvetica, sans-serif">
            <font size=1 color=blue face="Arial, Helvetica, sans-serif">
            &nbsp;<b>#FixDecimals(read_data2.a_802_b)#</b>
            </font>
      </td>
      <td align="right">
            <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=blue face="Arial, Helvetica, sans-serif">
        &nbsp;<b>#FixDecimals(read_data2.a_802_c)#</b> </font></td>
    </tr>
    <tr>
        <td>
            <font size="1" face="Arial, Helvetica, sans-serif">
            <font size=1 color=black face="Arial, Helvetica, sans-serif">
            803. <cfif read_data2.a_803_a neq ''><b>#FixDecimals(read_data2.a_803_a)#</b><cfelse>Appraisal Fee</cfif></font>&nbsp;&nbsp;<font size=1 color=blue face="Arial, Helvetica, sans-serif">&nbsp;
            </font>
        </td>
        <td align="right">
            <font size="1" face="Arial, Helvetica, sans-serif">
            <font size=1 color=blue face="Arial, Helvetica, sans-serif">
            &nbsp;
            <b><cfif read_data2.a_803_b neq '' and read_data2.a_803_b neq 0>#FixDecimals(read_data2.a_803_b)#</cfif></b></font>
        </td>
        <td align="right">
            <font size="1" face="Arial, Helvetica, sans-serif">
            <font size=1 color=blue face="Arial, Helvetica, sans-serif">
            &nbsp;
            <b><cfif read_data2.a_803_c neq '' and read_data2.a_803_c neq 0>#FixDecimals(read_data2.a_803_c)#</cfif></b>
            </font>
        </td>
    </tr>
    <tr>
        <td>
            <font size="1" face="Arial, Helvetica, sans-serif">
            <font size=1 color=black face="Arial, Helvetica, sans-serif">
            804. <cfif read_data2.a_804_a neq ''><b>#FixDecimals(read_data2.a_804_a)#</b><cfelse>Credit Report</cfif>&nbsp;&nbsp; </font><font size=1 color=blue face="Arial, Helvetica, sans-serif">&nbsp;
            </font>
       </td>
        <td align="right">
            <font size="1" face="Arial, Helvetica, sans-serif">
            <font size=1 color=blue face="Arial, Helvetica, sans-serif">
            &nbsp;<b><cfif read_data2.a_804_b neq '' and read_data2.a_804_b neq 0>#FixDecimals(read_data2.a_804_b)#</cfif></b>
            </font>
        </td>
        <td align="right">
            <font size="1" face="Arial, Helvetica, sans-serif">
            <font size=1 color=blue face="Arial, Helvetica, sans-serif">
            &nbsp;
            <b><cfif read_data2.a_804_c neq '' and read_data2.a_804_c neq 0>#FixDecimals(read_data2.a_804_c)#</cfif></b></font>
        </td>
    </tr>
    <tr>

      <td>
        <font size="1" face="Arial, Helvetica, sans-serif">
        <font size=1 color=black face="Arial, Helvetica, sans-serif">
        805. <cfif read_data2.a_805_a neq '' and read_data2.a_805_a neq 'NULL'><b>#FixDecimals(read_data2.a_805_a)#</b></cfif> &nbsp;&nbsp; <cfif read_data2.a_805_c neq '' and read_data2.a_805_c neq 'NULL'><b>#FixDecimals(read_data2.a_805_c)#</b></cfif>
        </font>
      </td>
         <td align="right">
            <font size="1" face="Arial, Helvetica, sans-serif">
            <font size=1 color=blue face="Arial, Helvetica, sans-serif">
            &nbsp;<b><cfif read_data2.a_805_b neq '' and read_data2.a_805_b neq 0>#FixDecimals(read_data2.a_805_b)#</cfif></b>
            </font>
        </td>
        <td align="right">
            <font size="1" face="Arial, Helvetica, sans-serif">
            <font size=1 color=blue face="Arial, Helvetica, sans-serif">
            &nbsp;
            <b><cfif read_data2.a_805_d neq '' and read_data2.a_805_d neq 0>#FixDecimals(read_data2.a_805_d)#</cfif></b></font>
        </td>
    </tr>
    <tr>
        <td>
            <font size="1" face="Arial, Helvetica, sans-serif">
            <font size=1 color=black face="Arial, Helvetica, sans-serif">
            806. <cfif read_data2.a_806_a neq '' and read_data2.a_806_a neq 'NULL'><b>#FixDecimals(read_data2.a_806_a)#</b></cfif> &nbsp;&nbsp; <cfif read_data2.a_806_c neq '' and read_data2.a_806_c neq 'NULL'><b>#FixDecimals(read_data2.a_806_c)#</b></cfif>
            </font>
        </td>
         <td align="right">
            <font size="1" face="Arial, Helvetica, sans-serif">
            <font size=1 color=blue face="Arial, Helvetica, sans-serif">
            &nbsp;<b><cfif read_data2.a_806_b neq '' and read_data2.a_806_b neq 0>#FixDecimals(read_data2.a_806_b)#</cfif></b>
            </font>
        </td>
        <td align="right">
            <font size="1" face="Arial, Helvetica, sans-serif">
            <font size=1 color=blue face="Arial, Helvetica, sans-serif">
            &nbsp;
            <b><cfif read_data2.a_806_d neq '' and read_data2.a_806_d neq 0>#FixDecimals(read_data2.a_806_d)#</cfif></b></font>
        </td>
    </tr>
    <tr>
        <td>
            <font size="1" face="Arial, Helvetica, sans-serif">
            <font size=1 color=black face="Arial, Helvetica, sans-serif">
            807. <cfif read_data2.a_807_a neq '' and read_data2.a_807_a neq 'NULL'><b>#FixDecimals(read_data2.a_807_a)#</b></cfif> &nbsp;&nbsp; <cfif read_data2.a_807_c neq '' and read_data2.a_807_c neq 'NULL'><b>#FixDecimals(read_data2.a_807_c)#</b></cfif>
            </font>
        </td>
         <td align="right">
            <font size="1" face="Arial, Helvetica, sans-serif">
            <font size=1 color=blue face="Arial, Helvetica, sans-serif">
            &nbsp;<b><cfif read_data2.a_807_b neq '' and read_data2.a_807_b neq 0>#FixDecimals(read_data2.a_807_b)#</cfif></b>
            </font>
        </td>
        <td align="right">
            <font size="1" face="Arial, Helvetica, sans-serif">
            <font size=1 color=blue face="Arial, Helvetica, sans-serif">
            &nbsp;
            <b><cfif read_data2.a_807_d neq '' and read_data2.a_807_d neq 0>#FixDecimals(read_data2.a_807_d)#</cfif></b></font>
        </td>
    </tr>
    <tr>
        <td>
            <font size="1" face="Arial, Helvetica, sans-serif">
            <font size=1 color=black face="Arial, Helvetica, sans-serif">
            808. <cfif read_data2.a_808_a neq '' and read_data2.a_808_a neq 'NULL'><b>#FixDecimals(read_data2.a_808_a)#</b></cfif> &nbsp;&nbsp; <cfif read_data2.a_808_c neq '' and read_data2.a_808_c neq 'NULL'><b>#FixDecimals(read_data2.a_808_c)#</b></cfif>
            </font>
        </td>
        <td align="right">
            <font size="1" face="Arial, Helvetica, sans-serif">
            <font size=1 color=blue face="Arial, Helvetica, sans-serif">
            &nbsp;<b><cfif read_data2.a_808_b neq '' and read_data2.a_808_b neq 0>#FixDecimals(read_data2.a_808_b)#</cfif></b>
            </font>
        </td>
        <td align="right">
            <font size="1" face="Arial, Helvetica, sans-serif">
            <font size=1 color=blue face="Arial, Helvetica, sans-serif">
            &nbsp;
            <b><cfif read_data2.a_808_d neq '' and read_data2.a_808_d neq 0>#FixDecimals(read_data2.a_808_d)#</cfif></b></font>
        </td>
    </tr>
    <tr>
        <td>
            <font size="1" face="Arial, Helvetica, sans-serif">
            <font size=1 color=black face="Arial, Helvetica, sans-serif">
            809. <cfif read_data2.a_809_a neq '' and read_data2.a_809_a neq 'NULL'><b>#FixDecimals(read_data2.a_809_a)#</b></cfif> &nbsp;&nbsp; <cfif read_data2.a_809_c neq '' and read_data2.a_809_c neq 'NULL'><b>#FixDecimals(read_data2.a_809_c)#</b></cfif>
            </font>
        </td>
         <td align="right">
            <font size="1" face="Arial, Helvetica, sans-serif">
            <font size=1 color=blue face="Arial, Helvetica, sans-serif">
            &nbsp;<b><cfif read_data2.a_809_b neq '' and read_data2.a_809_b neq 0>#FixDecimals(read_data2.a_809_b)#</cfif></b>
            </font>
        </td>
        <td align="right">
            <font size="1" face="Arial, Helvetica, sans-serif">
            <font size=1 color=blue face="Arial, Helvetica, sans-serif">
            &nbsp;
            <b><cfif read_data2.a_809_d neq '' and read_data2.a_809_d neq 0>#FixDecimals(read_data2.a_809_d)#</cfif></b></font>
        </td>
    </tr>
    <tr>
        <td>
            <font size="1" face="Arial, Helvetica, sans-serif">
            <font size=1 color=black face="Arial, Helvetica, sans-serif">
            810. <cfif read_data2.a_810_a neq '' and read_data2.a_810_a neq 'NULL'><b>#FixDecimals(read_data2.a_810_a)#</b></cfif> &nbsp;&nbsp; <cfif read_data2.a_810_c neq '' and read_data2.a_810_c neq 'NULL'><b>#FixDecimals(read_data2.a_810_c)#</b></cfif>
            </font>
        </td>
         <td align="right">
            <font size="1" face="Arial, Helvetica, sans-serif">
            <font size=1 color=blue face="Arial, Helvetica, sans-serif">
            &nbsp;<b><cfif read_data2.a_810_b neq '' and read_data2.a_810_b neq 0>#FixDecimals(read_data2.a_810_b)#</cfif></b>
            </font>
        </td>
        <td align="right">
            <font size="1" face="Arial, Helvetica, sans-serif">
            <font size=1 color=blue face="Arial, Helvetica, sans-serif">
            &nbsp;
            <b><cfif read_data2.a_810_d neq '' and read_data2.a_810_d neq 0>#FixDecimals(read_data2.a_810_d)#</cfif></b></font>
        </td>
    </tr>
    <tr>
        <td>
            <font size="1" face="Arial, Helvetica, sans-serif">
            <font size=1 color=black face="Arial, Helvetica, sans-serif">
            811. <cfif read_data2.a_811_a neq '' and read_data2.a_811_a neq 'NULL'><b>#FixDecimals(read_data2.a_811_a)#</b></cfif> &nbsp;&nbsp; <cfif read_data2.a_811_c neq '' and read_data2.a_811_c neq 'NULL'><b>#FixDecimals(read_data2.a_811_c)#</b></cfif>
            </font>
        </td>
        <td align="right">
            <font size="1" face="Arial, Helvetica, sans-serif">
            <font size=1 color=blue face="Arial, Helvetica, sans-serif">
            &nbsp;<b><cfif read_data2.a_811_b neq '' and read_data2.a_811_b neq 0>#FixDecimals(read_data2.a_811_b)#</cfif></b>
            </font>
        </td>
        <td align="right">
            <font size="1" face="Arial, Helvetica, sans-serif">
            <font size=1 color=blue face="Arial, Helvetica, sans-serif">
            &nbsp;
            <b><cfif read_data2.a_811_d neq '' and read_data2.a_811_d neq 0>#FixDecimals(read_data2.a_811_d)#</cfif></b></font>
        </td>
    </tr>
    <tr>
      <td colspan=3> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=black face="Arial, Helvetica, sans-serif">900. ITEMS REQUIRED BY LENDER TO BE PAID IN ADVANCE </font></td>
    </tr>
    <tr>
      <td> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=black face="Arial, Helvetica, sans-serif">901. Interest From&nbsp;&nbsp;<font color=blue> <b>#read_data2.a_901_a#</b></font>&nbsp;&nbsp;&nbsp;to
        &nbsp;&nbsp;<font color=blue> <b>#read_data2.a_901_b#</b></font>&nbsp;&nbsp;
        @ $ <font color=blue> <b>#FixDecimals(read_data2.a_901)#</b> </font></font> <font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;/day
        </font></td>
      <td align="right"> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=blue face="Arial, Helvetica, sans-serif">
        &nbsp;<b>#FixDecimals(read_data2.a_901_d)#</b> </font></td>
      <td align="right"> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=blue face="Arial, Helvetica, sans-serif">
        &nbsp;<b>#FixDecimals(read_data2.a_901_e)#</b> </font></td>
    </tr>
    <tr>
      <td> <font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=black face="Arial, Helvetica, sans-serif">902. Mortgage Insurance Premium for&nbsp;&nbsp;<font color=blue><b>#read_data2.a_902_a#</b>
        </font>&nbsp;&nbsp;&nbsp; to <font color=blue> <b>#read_data2.a_902_b#</b>
        </font></font></td>
      <td align="right"> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=blue face="Arial, Helvetica, sans-serif">
        &nbsp;<b>#FixDecimals(read_data2.a_902_c)#</b> </font></td>
      <td align="right"> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=blue face="Arial, Helvetica, sans-serif">
        &nbsp;<b>#FixDecimals(read_data2.a_902_d)#</b> </font></td>
    </tr>
    <tr>
      <td> <font size="1" face="Arial, Helvetica, sans-serif">903. Hazard
        Insurance Premium for &nbsp;&nbsp;<font color="blue"> <b>#read_data2.a_903_a#</b>&nbsp;&nbsp;&nbsp;<font color="##000000">
        to</font> <b>#read_data2.a_903_b#</b></font> </font></td>
      <td align="right"> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=blue face="Arial, Helvetica, sans-serif">
        &nbsp;<b>#FixDecimals(read_data2.a_903_c)#</b> </font></td>
      <td align="right"> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=blue face="Arial, Helvetica, sans-serif">
        &nbsp;<b>#FixDecimals(read_data2.a_903_d)#</b> </font></td>
    </tr>
    <tr>
      <td> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=black face="Arial, Helvetica, sans-serif">904. #read_data2.a_904_a# &nbsp;&nbsp;&nbsp;&nbsp;#read_data2.a_904_c#</font></td>
      <td align="right"> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=blue face="Arial, Helvetica, sans-serif">
        &nbsp;<b>#FixDecimals(read_data2.a_904_b)#</b> </font></td>
      <td align="right"> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=blue face="Arial, Helvetica, sans-serif">
        &nbsp;<b>#FixDecimals(read_data2.a_904_d)#</b> </font></td>
    </tr>
    <tr>
      <td> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=black face="Arial, Helvetica, sans-serif">905. Lender's Inspection Fee </font></td>
      <td align="right"> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=blue face="Arial, Helvetica, sans-serif">
        &nbsp;<b>#FixDecimals(read_data2.a_905_a)#</b> </font></td>
      <td align="right"> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=blue face="Arial, Helvetica, sans-serif">
        &nbsp;<b>#FixDecimals(read_data2.a_905_b)#</b> </font></td>
    </tr>
    <tr>
      <td colspan="3"> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=black face="Arial, Helvetica, sans-serif">1000. RESERVES DEPOSITED WITH LENDER FOR </font></td>
    </tr>
    <tr>
      <td> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=black face="Arial, Helvetica, sans-serif">1001. Hazard Insurance&nbsp;&nbsp; <font color=blue> <b>#read_data2.a_1001_a#</b></font>mo.
        @ $&nbsp;&nbsp;<font color=blue> <b>#read_data2.a_1001_b#</b></font>&nbsp;&nbsp;/mo
        </font></td>
      <td align="right"> <font size=1 color=blue face="Arial, Helvetica, sans-serif">
        &nbsp;<b>#FixDecimals(read_data2.a_1001_c)#</b></font> </td>
      <td align="right"> <font size=1 color=blue face="Arial, Helvetica, sans-serif">
        &nbsp;<b>#FixDecimals(read_data2.a_1001_d)#</b></font> </td>
    </tr>
    <tr>
      <td> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=black face="Arial, Helvetica, sans-serif">1002. Mortgage Insurance&nbsp;&nbsp; <font color=blue> <b>#read_data2.a_1002_a#</b></font>mo.
        @ $&nbsp;&nbsp;<font color=blue> <b>#FixDecimals(read_data2.a_1002_b)#</b></font>&nbsp;&nbsp;/mo
        </font></td>
      <td align="right"> <font size=1 color=blue face="Arial, Helvetica, sans-serif">
        &nbsp;<b>#FixDecimals(read_data2.a_1002_c)#</b></font> </td>
      <td align="right"> <font size=1 color=blue face="Arial, Helvetica, sans-serif">
        &nbsp;<b>#FixDecimals(read_data2.a_1002_d)#</b></font> </td>
    </tr>
    <tr>
      <td> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=black face="Arial, Helvetica, sans-serif">1003. City Property Taxes&nbsp;&nbsp; <font color=blue> <b>#read_data2.a_1003_a#</b></font>mo.
        @ $&nbsp;&nbsp;<font color=blue> <b>#read_data2.a_1003_b#</b></font>&nbsp;&nbsp;/mo
        </font></td>
      <td align="right"> <font size=1 color=blue face="Arial, Helvetica, sans-serif">
        &nbsp;<b>#FixDecimals(read_data2.a_1003_c)#</b></font> </td>
      <td align="right"> <font size=1 color=blue face="Arial, Helvetica, sans-serif">
        &nbsp;<b>#FixDecimals(read_data2.a_1003_d)#</b></font> </td>
    </tr>
    <tr>
      <td> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=black face="Arial, Helvetica, sans-serif">1004. County Property Taxes&nbsp;&nbsp; <font color=blue> <b><cfif read_data2.a_1004_a neq '' and read_data2.a_1004_a neq 'NULL'>#read_data2.a_1004_a#</cfif></b></font>mo.
        @ $&nbsp;&nbsp;<font color=blue><b>#read_data2.a_1004_b#</b></font>&nbsp;&nbsp;/mo</font></td>
      <td align="right"> <font size=1 color=blue face="Arial, Helvetica, sans-serif">
        &nbsp;<b>#FixDecimals(read_data2.a_1004_c)#</b></font> </td>
      <td align="right"> <font size=1 color=blue face="Arial, Helvetica, sans-serif">
        &nbsp;<b>#FixDecimals(read_data2.a_1004_d)#</b></font> </td>
    </tr>
    <tr>
      <td> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=black face="Arial, Helvetica, sans-serif">1005. Annual Assessments&nbsp;&nbsp; <font color=blue> <b>#read_data2.a_1005_a#</b></font>mo.
        @ $&nbsp;&nbsp;<font color=blue> <b>#read_data2.a_1005_b#</b></font>&nbsp;&nbsp;/mo
        </font></td>
      <td align="right"> <font size=1 color=blue face="Arial, Helvetica, sans-serif">
        &nbsp;<b>#FixDecimals(read_data2.a_1005_c)#</b></font> </td>
      <td align="right"> <font size=1 color=blue face="Arial, Helvetica, sans-serif">
        &nbsp;<b>#FixDecimals(read_data2.a_1005_d)#</b></font> </td>
    </tr>
    <tr>
      <td> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=black face="Arial, Helvetica, sans-serif">1006. Aggragate Analysis Adjustment &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;to</font></td>
      <td align="right"> <font size=1 color=blue face="Arial, Helvetica, sans-serif">
        &nbsp;<b>#FixDecimals(read_data2.a_1006_a)#</b></font> </td>
      <td align="right"> <font size=1 color=blue face="Arial, Helvetica, sans-serif">
        &nbsp;<b>#FixDecimals(read_data2.a_1006_b)#</b></font> </td>
    </tr>
    <tr>
      <td colspan="3"> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=black face="Arial, Helvetica, sans-serif">1100. TITLE CHARGES </font></td>
    </tr>
    <tr>
      <td><font size="1" face="Arial, Helvetica, sans-serif">1101. Settlement
        or closing fee&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;to
		<cfif (read_data2.a_1101_a neq '' and read_data2.a_1101_a neq 'NULL') or (read_data2.a_1101_f neq '' and read_data2.a_1101_f neq 'NULL')>
        <font color=blue><cfif #read_data2.a_1101_c# neq "0" AND #read_data2.a_1101_c# neq ""> <b>#read_data2.a_1101_c#</b><cfelse> <b>#read_agency.title_ft_agency_name#</b></cfif></font></font></cfif></td>
      <td align="right"><font size=1 color=blue face="Arial, Helvetica, sans-serif"><cfif #read_data2.a_1101_a# neq "0">
        &nbsp;<b>#FixDecimals(read_data2.a_1101_a)#</b></font> <font size="1" face="Arial, Helvetica, sans-serif"></cfif></font></td>
      <td align="right"><font size=1 color=blue face="Arial, Helvetica, sans-serif"><cfif #read_data2.a_1101_f# neq "0">
        &nbsp;<b>#FixDecimals(read_data2.a_1101_f)#</b></font> <font size="1" face="Arial, Helvetica, sans-serif"></cfif></font></td>
    </tr>
    <tr>
      <td><font size="1" face="Arial, Helvetica, sans-serif">1102. Abstract or Title Search&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;to
        <cfif #read_data2.a_1102_a# neq "0" or #read_data2.a_1102_b# neq "0"><cfif get_comp_info.ID eq 202><b>ESS Solutions, LLC</b><cfelse><b>Abstracts USA, LLC</b></cfif></cfif></font></td>
      <td align="right">
<cfif #read_data2.a_1102_a# neq "0">&nbsp;
          <b><font color="##0000FF" size="1" face="Arial, Helvetica, sans-serif">#FixDecimals(read_data2.a_1102_a)#</font></b>
        </cfif></td>
      <td align="right">
<cfif #read_data2.a_1102_b# neq "0">&nbsp;
          <b><font color="##0000FF" size="1" face="Arial, Helvetica, sans-serif">#FixDecimals(read_data2.a_1102_b)#</font></b>
        </cfif></td>
    </tr>
    <tr valign="top">
      <td> <font size="1" face="Arial, Helvetica, sans-serif">1103. Title
        Examination&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;to <cfif (read_data2.a_1103_a neq '' and read_data2.a_1103_a neq 'NULL') or (read_data2.a_1103_b neq '' and read_data2.a_1103_b neq 'NULL')>
        <font color=blue><cfif #read_data2.a_1103_c# neq "0" AND #read_data2.a_1103_c# neq ""> <b>#read_data2.a_1103_c#</b><cfelse> <b>#read_agency.title_ft_agency_name#</b></cfif></font></font></cfif></td>
      <td align="right"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue> <cfif #read_data2.a_1103_a# neq "0">
        <b>#FixDecimals(read_data2.a_1103_a)#</b></font></font> <font size="1" face="Arial, Helvetica, sans-serif"></cfif></font></td>
      <td align="right"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue> <cfif #read_data2.a_1103_b# neq "0">
        <b>#FixDecimals(read_data2.a_1103_b)#</b></font></font> <font size="1" face="Arial, Helvetica, sans-serif"></cfif></font></td>
    </tr>
    <tr>
      <td> <font size="1" face="Arial, Helvetica, sans-serif">1104. Title
        Insurance Binder&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;to
        <cfif (read_data2.a_1104_a neq '' and read_data2.a_1104_a neq 'NULL') or (read_data2.a_1104_b neq '' and read_data2.a_1104_b neq 'NULL')>
        <font color=blue><cfif #read_data2.a_1104_c# neq "0" AND #read_data2.a_1104_c# neq ""> <b>#read_data2.a_1104_c#</b><cfelse> <CFIF #get_titleid.pstate# eq "CA">
                <b>#title_co_name# & Escrow, inc.</b>
            <CFELSEIF #get_titleid.pstate# eq "NV">
                <b>#title_co_name# & Escrow, inc.</b>
            <CFELSE>
                <b>#read_agency.title_ft_agency_name#</b>
            </CFIF> </cfif></font></font></cfif>
      </td>
      <td align="right"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue> <cfif #read_data2.a_1104_a# neq "0">
        <b>#FixDecimals(read_data2.a_1104_a)#</b></font></font> <font size="1" face="Arial, Helvetica, sans-serif"></cfif></font></td>
      <td align="right"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue> <cfif #read_data2.a_1104_b# neq "0">
        <b>#FixDecimals(read_data2.a_1104_b)#</b></font></font> <font size="1" face="Arial, Helvetica, sans-serif"></cfif></font></td>
    </tr>
    <tr>
      <td> <font size="1" face="Arial, Helvetica, sans-serif">1105. Document
        Preparation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;to
 <cfif (read_data2.a_1105_a neq '' and read_data2.a_1105_a neq 'NULL') or (read_data2.a_1105_b neq '' and read_data2.a_1105_b neq 'NULL')>
        <font color=blue><cfif #read_data2.a_1105_c# neq "0" AND #read_data2.a_1105_c# neq ""> <b>#read_data2.a_1105_c#</b><cfelse> <CFIF #get_titleid.pstate# eq "CA">
                <b>#title_co_name# & Escrow, inc.</b>
            <CFELSEIF #get_titleid.pstate# eq "NV">
                <b>#title_co_name# & Escrow, inc.</b>
            <CFELSE>
                <b>#read_agency.title_ft_agency_name#</b>
            </CFIF> </cfif></font></font></cfif>
      </td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue> <cfif #read_data2.a_1105_a# neq "0">
        <b>#FixDecimals(read_data2.a_1105_a)#</b></font></font> <font size="1" face="Arial, Helvetica, sans-serif"></cfif></font></td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue> <cfif #read_data2.a_1105_b# neq "0">
        <b>#FixDecimals(read_data2.a_1105_b)#</b></font></font> <font size="1" face="Arial, Helvetica, sans-serif"></cfif></font></td>
    </tr>
    <tr >
      <td> <font size="1" face="Arial, Helvetica, sans-serif">1106. Notary Fees&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;to

        <cfif (read_data2.a_1106_a neq '' and read_data2.a_1106_a neq 'NULL') or (read_data2.a_1106_b neq '' and read_data2.a_1106_b neq 'NULL')>
        <font color=blue><cfif #read_data2.a_1106_c# neq "0" AND #read_data2.a_1106_c# neq ""> <b>#read_data2.a_1106_c#</b><cfelse> <CFIF #get_titleid.pstate# eq "CA">
                <b>#title_co_name# & Escrow, inc.</b>
            <CFELSEIF #get_titleid.pstate# eq "NV">
                <b>#title_co_name# & Escrow, inc.</b>
            <CFELSE>
                <b>#read_agency.title_ft_agency_name#</b>
            </CFIF> </cfif></font></font></cfif>
      </td>
      <td align="right"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue> <cfif #read_data2.a_1106_a# neq "0">
        <b>#FixDecimals(read_data2.a_1106_a)#</b></font></font> <font size="1" face="Arial, Helvetica, sans-serif"></cfif></font></td>
      <td align="right"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue> <cfif #read_data2.a_1106_b# neq "0">
        <b>#FixDecimals(read_data2.a_1106_b)#</b></font></font> <font size="1" face="Arial, Helvetica, sans-serif"></cfif></font></td>
    </tr>
    <tr>
      <td> <font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font color=black>1107. Attorney's Fees </font></font> &nbsp;&nbsp;&nbsp;to
	  <cfif (read_data2.a_1107_a neq '' and read_data2.a_1107_a neq 'NULL') or (read_data2.a_1107_b neq '' and read_data2.a_1107_b neq 'NULL')>
        <font color=blue><cfif #read_data2.a_1107_d# neq "0" AND #read_data2.a_1107_d# neq ""> <b>#read_data2.a_1107_d#</b><cfelse> <CFIF #get_titleid.pstate# eq "CA">
                <b>#title_co_name# & Escrow, inc.</b>
            <CFELSEIF #get_titleid.pstate# eq "NV">
                <b>#title_co_name# & Escrow, inc.</b>
            <CFELSE>
                <b>#read_agency.title_ft_agency_name#</b>
            </CFIF> </cfif></font></font></cfif>
			</td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue> <cfif #read_data2.a_1107_a# neq "0">
        <b>#FixDecimals(read_data2.a_1107_a)#</b></font></font> <font size="1" face="Arial, Helvetica, sans-serif"></cfif></font></td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue> <cfif #read_data2.a_1107_b# neq "0">
        <b>#FixDecimals(read_data2.a_1107_b)#</b></font></font> <font size="1" face="Arial, Helvetica, sans-serif"></cfif></font></td>
    </tr>
    <tr >
      <td> <font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font color=black>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(includes above items No.&nbsp;&nbsp;<font color=blue>
        <b>#read_data2.a_1107_c#</b></font>) </font></font></td>
      <td align="right"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
    </tr>
    <tr >
        <td>
            <font size="1" face="Arial, Helvetica, sans-serif">
            <font size="1" face="Arial, Helvetica, sans-serif">
            <font color=black>
            1108. Title Insurance
	        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;to
            <font color=blue>
            <cfif #read_data2.a_1108_a# neq "0" OR #read_data2.a_1108_b# neq "">
                <CFIF #get_titleid.pstate# eq "CA">
                    <b>Placer Title Company</b>
                <CFELSEIF #get_titleid.pstate# eq "NV">
                    <b>Stewart Title Guaranty Company</b>
                <CFELSEIF #get_titleid.comp_id# eq 3704 or #get_titleid.comp_id# eq 3746 or  #get_titleid.comp_id# eq 3747 or  #get_titleid.comp_id# eq 3748>
                    <b>Worldwide Abstract</b>
                <CFELSE>
                    <b>#title_co_name#/#get_ins.company#</b>
                </CFIF>
            </cfif>
            </font>
            </font>
        </td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue> <cfif #read_data2.a_1108_a# neq "0">
        <b><cfif get_titleid.pstate eq 'TX' and get_titleid.searchType NEQ 'Purchase'>Call us for R-8 credit<cfelse><cfif isnumeric(read_data2.a_1108_a)>#NumberFormat(read_data2.a_1108_a, "_____.__")#<cfelse>#read_data2.a_1108_a#</cfif></cfif></b></font></font> <font size="1" face="Arial, Helvetica, sans-serif"></cfif></font></td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue> <cfif #read_data2.a_1108_b# neq "0">
        <b>#FixDecimals(read_data2.a_1108_b)#</b></font></font> <font size="1" face="Arial, Helvetica, sans-serif"></cfif></font></td>
    </tr>
    <tr >
      <td > <font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font color=black>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(includes above items No.&nbsp;&nbsp;<font color=blue><b>#FixDecimals(read_data2.a_1108_c)#</b></font>)
        </font></font></td>
      <td align="right"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
    </tr>
    <tr >
      <td > <font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font color=black>1109. Lender's Coverage $ <font color=blue>
        <cfif #read_data2.a_1109_a# neq "0">
          <b>#FixDecimals(read_data2.a_1109_a)#</b>
        </cfif>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<cfif #read_data.a_206_b# neq "" and #read_data.a_206_b# neq "0" and #read_data.a_206_b# neq "NULL">#read_data2.first_ins_premium#(1st) + #read_data2.second_ins_premium#(2nd)</cfif>
        </font></font></font> </td>
      <td rowspan="2" align="right"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
      <td rowspan="2" align="right"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
    </tr>
    <tr >
      <td > <font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font color=black>1110. Owner's Coverage $ <font color=blue>
        <cfif #read_data2.a_1110_a# neq "0">
          <b>#FixDecimals(read_data2.a_1110_a)#</b>
        </cfif>
        </font></font></font> </td>
    </tr>
    <tr>
      <td ><font size="1" face="Arial, Helvetica, sans-serif">1111. <font color=blue>
        <cfif (read_data2.a_1111_a neq '' and read_data2.a_1111_a neq 'NULL') or (read_data2.a_1111_b neq '' and read_data2.a_1111_b neq 'NULL')>
        <font color=blue><cfif #read_data2.a_1111_c# neq "0" AND #read_data2.a_1111_c# neq ""> <b>#read_data2.a_1111_c#</b><cfelse> <b>#read_agency.title_ft_agency_name#</b></cfif></font></font></cfif>
      </td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue> <cfif #read_data2.a_1111_a# neq "0">
        <b>#FixDecimals(read_data2.a_1111_a)#</b></font></font> <font size="1" face="Arial, Helvetica, sans-serif"></cfif></font></td>
      <td align="right"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue> <cfif #read_data2.a_1111_b# neq "0">
        <b>#FixDecimals(read_data2.a_1111_b)#</b></font></font> <font size="1" face="Arial, Helvetica, sans-serif"></cfif></font></td>
    </tr>
    <tr >
      <td > <font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font color=black>1112.  <cfif (IsNumeric(read_data2.a_1112_a) or IsNumeric(read_data2.a_1112_b))>
        <font color=blue><cfif #read_data2.a_1112_c# neq "0" AND #read_data2.a_1112_c# neq ""> <b>#read_data2.a_1112_c#</b><cfelse><cfif (IsNumeric(FixDecimals(read_data2.a_1112_a))) or (IsNumeric(FixDecimals(read_data2.a_1112_b)))>&nbsp;&nbsp;<b>#read_agency.title_ft_agency_name#</b></cfif></cfif></font></font></cfif></td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;
	  <font color=blue> <cfif #read_data2.a_1112_a# neq "0">
        <b>#FixDecimals(read_data2.a_1112_a)#</b></font></font> <font size="1" face="Arial, Helvetica, sans-serif"></cfif></font></td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue><cfif #read_data2.a_1112_b# neq "0"><b>#FixDecimals(read_data2.a_1112_b)#</b></font></font>
        <font size="1" face="Arial, Helvetica, sans-serif"></cfif></font></td>
    </tr>
    <tr >
      <td > <font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font color=black>1113.  <cfif (IsNumeric(read_data2.a_1113_a) or IsNumeric(read_data2.a_1113_b))>
        <font color=blue><cfif #read_data2.a_1113_c# neq "0" AND #read_data2.a_1113_c# neq ""> <b>#read_data2.a_1113_c#</b><cfelse><cfif (IsNumeric(FixDecimals(read_data2.a_1113_a))) or (IsNumeric(FixDecimals(read_data2.a_1113_b)))>&nbsp;&nbsp;<b>#read_agency.title_ft_agency_name#</b></cfif></cfif></font></font></cfif></td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;
	  <font color=blue> <cfif #read_data2.a_1113_a# neq "0">
        <b>#FixDecimals(read_data2.a_1113_a)#</b></font></font> <font size="1" face="Arial, Helvetica, sans-serif"></cfif></font></td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue><cfif #read_data2.a_1113_b# neq "0"><b>#FixDecimals(read_data2.a_1113_b)#</b></font></font>
        <font size="1" face="Arial, Helvetica, sans-serif"></cfif></font></td>
    </tr>
	<tr >
      <td > <font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font color=black>1114. <font color=blue> <cfif (FixDecimals(read_data2.a_1114_a) neq '' and FixDecimals(read_data2.a_1114_a) neq 'NULL') or (FixDecimals(read_data2.a_1114_b) neq '' and FixDecimals(read_data2.a_1114_b) neq 'NULL')>
        <font color=blue><cfif #read_data2.a_1114_c# neq "0" AND #read_data2.a_1114_c# neq ""> <b>#read_data2.a_1114_c#</b><cfelse> <b>#read_agency.title_ft_agency_name#</b></cfif></font></font></cfif>
      </td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue> <cfif #read_data2.a_1114_a# neq "0">
        <b>#FixDecimals(read_data2.a_1114_a)#</b></font></font> <font size="1" face="Arial, Helvetica, sans-serif"></cfif></font></td>
      <td align="right"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue> <cfif #read_data2.a_1114_b# neq "0">
        <b>#FixDecimals(read_data2.a_1114_b)#</b></font></font> <font size="1" face="Arial, Helvetica, sans-serif"></cfif></font></td>
    </tr>
    <tr >
      <td colspan="3"> <font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font color=black>1200. GOVERNMENT RECORDING AND TRANSFER CHARGES </font></font></td>
    </tr>
    <tr >
      <td> <font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font color=black>1201. Recording Fees Deed $ &nbsp;&nbsp;<font color=blue>
        <cfif #read_data2.a_1201_a# neq "0">
          <b>#FixDecimals(read_data2.a_1201_a)#</b>
        </cfif>
        </font>&nbsp;&nbsp; Mortgage $ &nbsp;&nbsp;<font color=blue>
        <cfif #read_data2.a_1201_b# neq "0">
          <b>#FixDecimals(read_data2.a_1201_b)#</b>
        </cfif>
        </font>&nbsp;&nbsp;&nbsp;: Release $ <font color=blue>
        <cfif #read_data2.a_1201_c# neq "0">
          <b>#FixDecimals(read_data2.a_1201_c)#</b>
        </cfif>
        </font></font></font> </td>
      <td align="right"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue> <cfif #read_data2.a_1201_d# neq "0">
        &nbsp;<b>#FixDecimals(read_data2.a_1201_d)#</b></font></font> <font size="1" face="Arial, Helvetica, sans-serif"></cfif></font></td>
      <td align="right"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue> <cfif #read_data2.a_1201_e# neq "0">
        &nbsp;<b>#FixDecimals(read_data2.a_1201_e)#</b></font></font> <font size="1" face="Arial, Helvetica, sans-serif"></cfif></font></td>
    </tr>
    <tr>
      <td> <font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font color=black>1202. City/County tax/Stamps: &nbsp;&nbsp;<font color=blue>
        <cfif #read_data2.a_1202_a# neq "0">
          <b>#FixDecimals(read_data2.a_1202_a)#</b>
        </cfif>
        </font>&nbsp;&nbsp;Deed $ &nbsp;&nbsp;<font color=blue>
        <cfif #read_data2.a_1202_b# neq "0">
          <b>#FixDecimals(read_data2.a_1202_b)#</b>
        </cfif>
        </font>&nbsp;&nbsp;: Mortgage $ <font color=blue>
        <cfif #read_data2.a_1202_c# neq "0">
          <b>#FixDecimals(read_data2.a_1202_c)#</b>
        </cfif>
        </font></font></font> </td>
      <td align="right"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue>
        <cfif #read_data2.a_1202_d# neq "0">
          <b>#FixDecimals(read_data2.a_1202_d)#</b>
        </cfif>
        </font></font> </td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue>
        <cfif #read_data2.a_1202_e# neq "0">
          <b>#FixDecimals(read_data2.a_1202_e)#</b>
        </cfif>
        </font></font> </td>
    </tr>
    <tr >
      <td > <font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font color=black>1203. State tax/Stamps: &nbsp;&nbsp;<font color=blue>
        <cfif #read_data2.a_1203_a# neq "0">
          <b>#FixDecimals(read_data2.a_1203_a)#</b>
        </cfif>
        </font>&nbsp;&nbsp;Deed $ &nbsp;&nbsp;<font color=blue>
        <cfif #read_data2.a_1203_b# neq "0">
          <b>#FixDecimals(read_data2.a_1203_b)#</b>
        </cfif>
        </font>&nbsp;&nbsp;: Mortgage $ <font color=blue>
        <cfif #read_data2.a_1203_c# neq "0">
          <b>#FixDecimals(read_data2.a_1203_c)#</b>
        </cfif>
        </font></font></font> </td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue>
        <cfif #read_data2.a_1203_d# neq "0">
          <b>#FixDecimals(read_data2.a_1203_d)#</b>
        </cfif>
        </font></font> </td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue>
        <cfif #read_data2.a_1203_e# neq "0">
          <b>#FixDecimals(read_data2.a_1203_e)#</b>
        </cfif>
        </font></font> </td>
    </tr>
    <tr>
      <td> <font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font color=black>1204. <font color=blue>
       <cfif #read_data2.a_1204_b# neq "0" or #read_data2.a_1204_c# neq "0">
          <b>#FixDecimals(read_data2.a_1204_a)#</b>
        </cfif>
        </font></font></font> </td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue>
        <cfif #read_data2.a_1204_b# neq "0">
          <b>#FixDecimals(read_data2.a_1204_b)#</b>
        </cfif>
        </font></font> </td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue>
        <cfif #read_data2.a_1204_c# neq "0">
          <b>#FixDecimals(read_data2.a_1204_c)#</b>
        </cfif>
        </font></font> </td>
    </tr>
    <tr >
        <td>
            <font size="1" face="Arial, Helvetica, sans-serif">
            <font size="1" face="Arial, Helvetica, sans-serif">
            <font color=black>1205.
            <font color=blue> <cfif #get_titleid.pstate# eq "NV" or #get_titleid.pstate# eq "CA">Procurement Releases<cfelse>
                #get_line_costs.a_1205_text#</cfif>
                <cfif #read_data2.a_1205_a# neq "0" OR #read_data2.a_1205_b# neq "">
                    <CFIF #get_titleid.pstate# eq "CA">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>#title_co_name# & Escrow</b>
                <CFELSEIF #get_titleid.pstate# eq "NV">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>#title_co_name# & Escrow</b>
                <CFELSE>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>#read_agency.title_ft_agency_name#</b>
                </CFIF>
                </font></font></font>
                </cfif>
        </td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue>
        <cfif #read_data2.a_1205_a# neq "0">
          <b>#FixDecimals(read_data2.a_1205_a)#</b>
        </cfif>
        </font></font> </td>
      <td align="right"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue>
        <cfif #read_data2.a_1205_b# neq "0">
          <b>#FixDecimals(read_data2.a_1205_b)#</b>
        </cfif>
        </font></font> </td>
    </tr>
    <tr>
      <td colspan=3 > <font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font color=black>1300. ADDITIONAL SETTLEMENT CHARGES </font></font></td>
    </tr>
    <tr>
      <td> <font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font color=black>1301. <cfif (read_data2.a_1301_a neq '' and read_data2.a_1301_a neq 0) or (read_data2.a_1301_b neq '' and read_data2.a_1301_b neq 0)><cfif (read_data2.a_1301_text neq '' and read_data2.a_1301_text neq 'NULL')>#read_data2.a_1301_text#<cfelse>Survey </cfif></cfif></font></font></td>
      <td align="right"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue>
        <cfif #read_data2.a_1301_a# neq "0">
          <b>#FixDecimals(read_data2.a_1301_a)#</b>
        </cfif>
        </font></font> </td>
      <td align="right"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue>
        <cfif #read_data2.a_1301_b# neq "0">
          <b>#FixDecimals(read_data2.a_1301_b)#</b>
        </cfif>
        </font></font> </td>
    </tr>
	<tr>
      <td> <font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font color=black>1302. <cfif (read_data2.a_1302_a neq '' and read_data2.a_1302_a neq 0) or (read_data2.a_1302_b neq '' and read_data2.a_1302_b neq 0)><cfif (read_data2.a_1302_text neq '' and read_data2.a_1302_text neq 'NULL')>#read_data2.a_1302_text#<cfelse>Pest Inspection </cfif></cfif></font></font></td>
      <td align="right"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue>
        <cfif #read_data2.a_1302_a# neq "0">
          <b>#FixDecimals(read_data2.a_1302_a)#</b>
        </cfif>
        </font></font> </td>
      <td align="right"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue>
        <cfif #read_data2.a_1302_b# neq "0">
          <b>#FixDecimals(read_data2.a_1302_b)#</b>
        </cfif>
        </font></font> </td>
    </tr>
    <tr >
      	<td><font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font color=black>1303.
	  		<font color=blue><cfif (read_data2.a_1303_a neq '' and read_data2.a_1303_a neq 0) or (read_data2.a_1303_b neq '' and read_data2.a_1303_b neq 0)>
			<CFIF #Len(read_data2.a_1303_text)# gt 0>
				#read_data2.a_1303_text#
			<CFELSE>
				#get_line_costs.a_1303_text#
			</CFIF>
			<CFIF #Len(read_data2.a_1303_text)# eq 0>
				<cfif #read_data2.a_1303_a# neq "0" OR #read_data2.a_1303_b# neq "">
					&nbsp;&nbsp;&nbsp;<b>#read_agency.title_ft_agency_name#</b></font></font></font>
				</cfif>
			</CFIF>
			</cfif>
		</td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue>
        <cfif #read_data2.a_1303_a# neq "0">
          <b>#FixDecimals(read_data2.a_1303_a)#</b>
        </cfif>
        </font></font> </td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue>
        <cfif #read_data2.a_1303_b# neq "0">
          <b>#FixDecimals(read_data2.a_1303_b)#</b>
        </cfif>
        </font></font> </td>
    </tr>
    <tr >
    	<td>
			<font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font color=black>1304.
	  	  	<font color=blue><cfif (read_data2.a_1304_a neq '' and read_data2.a_1304_a neq 0) or (read_data2.a_1304_b neq '' and read_data2.a_1304_b neq 0)>
			<CFIF #Len(read_data2.a_1304_text)# gt 0>
				#read_data2.a_1304_text#
			<CFELSE>
				#get_line_costs.a_1304_text#
			</CFIF>
			<CFIF #Len(read_data2.a_1303_text)# eq 0>
		  		<cfif #read_data2.a_1304_a# neq "0" OR #read_data2.a_1304_b# neq "">
		  			&nbsp;&nbsp;
        			<b>#read_agency.title_ft_agency_name#</b></font></font></font>
				</CFIF>
			</cfif>
			</cfif>
	 	</td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue>
        <cfif #read_data2.a_1304_a# neq "0">
          <b>#FixDecimals(read_data2.a_1304_a)#</b>
        </cfif>
        </font></font> </td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue>
        <cfif #read_data2.a_1304_b# neq "0">
          <b>#FixDecimals(read_data2.a_1304_b)#</b>
        </cfif>
        </font></font> </td>
    </tr>
    <tr>
      	<td>
			<font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif">
	  		<font color=black>
			1305. <font color=blue><cfif (read_data2.a_1305_a neq '' and read_data2.a_1305_a neq 0) or (read_data2.a_1305_b neq '' and read_data2.a_1305_b neq 0)>
			<CFIF #Len(read_data2.a_1305_text)# gt 0>
				#read_data2.a_1305_text#
			<CFELSE>
				#get_line_costs.a_1305_text#
			</CFIF>
			<CFIF #Len(read_data2.a_1305_text)# eq 0>
				<cfif #read_data2.a_1305_a# neq "0" OR #read_data2.a_1305_b# neq "">
					&nbsp;&nbsp;<cfif get_titleid.comp_id neq 3276> <b>#read_agency.title_ft_agency_name#</b></cfif></font></font></font>
				</cfif>
			</CFIF>
			</cfif>
		</td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue>
        <cfif #read_data2.a_1305_a# neq "0">
          <b>#FixDecimals(read_data2.a_1305_a)#</b>
        </cfif>
        </font></font> </td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue>
        <cfif #read_data2.a_1305_b# neq "0">
          <b>#FixDecimals(read_data2.a_1305_b)#</b>
        </cfif>
        </font></font> </td>
    </tr>
    <tr>
      	<td>
			<font size="1" face="Arial, Helvetica, sans-serif">
			<font size="1" face="Arial, Helvetica, sans-serif">
			<font color=black>1306.
			<font color=blue> <cfif (read_data2.a_1306_c neq '' and read_data2.a_1306_c neq 0) or (read_data2.a_1306_b neq '' and read_data2.a_1306_b neq 0)>
			<CFIF #Len(read_data2.a_1306_text)# gt 0>
				#read_data2.a_1306_text#
			<CFELSE>
				<cfif #read_data2.a_1306_a# neq "0">
					#read_data2.a_1306_a#</font>
				</cfif>
			</CFIF>
			</cfif>
        	</font>
			</font>
		</td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue>
        <cfif #read_data2.a_1306_b# neq "0">
          <b>#FixDecimals(read_data2.a_1306_b)#</b>
        </cfif>
        </font></font> </td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue>
        <cfif #read_data2.a_1306_c# neq "0">
          <b>#FixDecimals(read_data2.a_1306_c)#</b>
        </cfif>
        </font></font> </td>
    </tr>
    <tr >
      <td ><font size="1" face="Arial, Helvetica, sans-serif">1307. <cfif (read_data2.a_1307_c neq '' and read_data2.a_1307_c neq 0) or (read_data2.a_1307_b neq '' and read_data2.a_1307_b neq 0)>
        <CFIF #Len(read_data2.a_1307_text)# gt 0>
				#read_data2.a_1307_text#
		<CFELSE>
			<cfif #read_data2.a_1307_a# neq "0">
          		<font color="blue">#read_data2.a_1307_a#</font>
        	</cfif>
		</CFIF>
		</cfif>
        </font></td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color="blue">
        <cfif #read_data2.a_1307_b# neq "0">
          <b>#FixDecimals(read_data2.a_1307_b)#</b>
        </cfif>
        </font></font></td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color="blue">
        <cfif #read_data2.a_1307_c# neq "0">
          <b>#FixDecimals(read_data2.a_1307_c)#</b>
        </cfif>
        </font></font></td>
    </tr>
    <tr >
      	<td>
			<font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif">
	  		<font color=black>1308. Subtotal from line 1520
			</font></font>
		</td>
      <td align="right" > <font size=1 color=blue face="Arial, Helvetica, sans-serif"> <cfif #read_data2.a_1308_b# neq "0">
        &nbsp;<b>#FixDecimals(read_data2.a_1308_b)#</b></font><font size="1" face="Arial, Helvetica, sans-serif"></cfif>
        </font></td>
      <td align="right" > <font size=1 color=blue face="Arial, Helvetica, sans-serif"> <cfif #read_data2.a_1308_c# neq "0">
        &nbsp;<b>#FixDecimals(read_data2.a_1308_c)#</b></font><font size="1" face="Arial, Helvetica, sans-serif"></cfif>
        </font></td>
    </tr>
    <tr>
      <td><font size="1" face="Arial, Helvetica, sans-serif"><br><font size="1" face="Arial, Helvetica, sans-serif">
        <font color=black>1400. TOTAL SETTLEMENT CHARGES &nbsp;&nbsp;&nbsp;&nbsp;(enter
        on lines 103, Section J and 502 Section K) </font></font></td>

      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif"><br>
        <font color=blue> <b>#FixDecimals(read_data2.a_1400_a)#</b></font></font> </td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif"><br>
        <font color=blue> <b>#FixDecimals(read_data2.a_1400_b)#</b></font></font> </td>
    </tr>
  </table>

  <table align="center" width="98%" cellspacing=0 cellpadding=0>
    <tr valign="center">
      <td align="center" valign="middle"><br><!--- <p>&nbsp;</p> ---> <strong><font size=1 face="Arial, Helvetica, sans-serif">
        HUD CERTIFICATION OF BUYER AND SELLER <br></font></strong></td>
    </tr>
    <tr>
      <td> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 face="Arial, Helvetica, sans-serif">I
        have carefully reviewed the HUD-1 Settlement Statement and to the best
        of my knowledge and belief, it is a true and accurate statement of all
        reciepts and disbursements made on my account or by me in this transaction.
        I further certify that I have recieved a copy of the HUD-1 Settlement
        Statement. I agree to further adjustments in the event of any errors or
        omissions and indemnify and hold harmless Settlement Agent against any
        such error or omissions </font></td>
    </tr>
    <tr>
      <td> <table align="center" width="100%" cellspacing=0 cellpadding=0>
          <tr>
            <td valign="middle" height="50">
              ________________________________________</td>
            <td valign="middle" height="50">
              ________________________________________</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td> <table align="center" width="100%" cellspacing=0 cellpadding=0>
          <tr>
            <td valign="middle" height="35">
              ________________________________________</td>
          </tr>
        </table></td>
    </tr>
	    <tr> <td>&nbsp;</td></tr>
    <tr>
      <td> <table>
          <tr>
            <td width="62%" align=left valign=top> <font size=1 face="Arial, Helvetica, sans-serif">WARNING:
              IT IS A CRIME TO KNOWINGLY MAKE FALSE STATEMENTS TO THE UNITED
              STATES ON THIS OR ANY OTHER SIMILAR FORM. PENALTIES UPON CONVICTION
              CAN INCLUDE A FINE AND IMPRISONMENT. FOR DETAILS SEE; TITLE 18 U.S.
              CODE SECTION 1001 AND SECTION 1010.</font> </td>
            <td width="2%">&nbsp;</td>
            <td width="36%" align=left valign=top><font size="1" face="Arial, Helvetica, sans-serif">
              The HUD-1 Settlement Statement which I have prepared is a true and
              accurate account of this transaction. I have caused or will cause
              the funds to be dispersed in accordance with this statement.</font></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td valign=top> <table align="center" width="100%" cellspacing=0 cellpadding=0>
          <tr valign="bottom">
            <td width="45%"><font size="1" face="Arial, Helvetica, sans-serif"><br>
              #title_co_name# and Escrow, Inc. -- <font color="FF0000">Printed <b>
           <cfif #read_data2.print_date# neq ""> #read_data2.print_date# </cfif><!--- June 21, 2001 at 14:30 ---></b></font></font></td>
            <td width="40%" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">By:______________________________________<br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;DATE </font></td>
            <td width="15%"><font size="1" face="Arial, Helvetica, sans-serif">REV.
              HUD-1 (3/86)</font></td>
          </tr>
        </table></td>
    </tr>
  </table>
<cfif #read_data2.a_1520# neq "">
  <!-------LAST PAGE ---->
  <p>&nbsp;</p>
<table border="0" cellspacing=0 cellpadding=0 align = "center" width="98%" bordercolordark="666666" bordercolorlight="666666" bordercolor="666666">
<tr><td colspan="3">
  <table align="center" width="100%" cellspacing=0 cellpadding=0>
          <tr>
            <td width="54%" align="left"> <b><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;U.S.
              DEPARTMENT OF HOUSING AND URBAN DEVELOPMENT</font></b></td>
            <td  width="27%"><font face="Arial, Helvetica, sans-serif" size="1">File
              Number: <b>#read_data2.title_id#</b></font></td>
            <td  width="19%" align="right"><font size="1" face="Arial, Helvetica, sans-serif">PAGE
              3</font></td>
          </tr>
          <tr>
            <td width="54%" align="left"> <b><font face="Arial, Helvetica, sans-serif" size="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SETTLEMENT
              STATEMENT</font></b></td>
            <td colspan="2"><font face="Arial, Helvetica, sans-serif" size="1">TitleExpress
              Settlement System Printed 09/15/2005 at 17:13 SJP</font></td>
          </tr>
        </table>
</td>
</tr>

<tr><td colspan="3" valign="top">
<table border="1" cellspacing=0 cellpadding=0 align = "center" width="100%" bordercolordark="666666" bordercolorlight="666666" bordercolor="666666">
          <tr>
            <td colspan="3"><p>&nbsp;</p>
              <br></td>
          </tr>
          <tr>
            <td align="center" colspan="3"><font face="Arial, Helvetica, sans-serif"><strong>ITEMIZATION
              OF HUD LINE 1308</strong></font></td>
          </tr>
          <tr>
            <td colspan="3"><p>&nbsp;</p>
              <br></td>
          </tr>
          <tr>
            <td><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1500.
              SCHEDULE OF DISBURSEMENTS</font></strong></td>
            <td align="center"><strong><font size="2" face="Arial, Helvetica, sans-serif">BUYER</font></strong></td>
            <td align="center"><strong><font size="2" face="Arial, Helvetica, sans-serif">SELLER</font></strong></td>
          </tr>
		  <tr>
            <td><font size="2" face="Arial, Helvetica, sans-serif"><br>
              &nbsp;&nbsp;1501. #read_data2.a_1501_a#</font></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1501_b#</font></strong></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1501_c#</font></strong></td>
          </tr>
		  <tr>
            <td><font size="2" face="Arial, Helvetica, sans-serif"><br>
              &nbsp;&nbsp;1502. #read_data2.a_1502_a#</font></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1502_b#</font></strong></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1502_c#</font></strong></td>
          </tr>
		  <tr>
            <td><font size="2" face="Arial, Helvetica, sans-serif"><br>
              &nbsp;&nbsp;1503. #read_data2.a_1503_a#</font></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1503_b#</font></strong></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1503_c#</font></strong></td>
          </tr>
		  <tr>
            <td><font size="2" face="Arial, Helvetica, sans-serif"><br>
              &nbsp;&nbsp;1504. #read_data2.a_1504_a#</font></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1504_b#</font></strong></td>

            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1504_c#</font></strong></td>
          </tr>
		  <tr>
            <td><font size="2" face="Arial, Helvetica, sans-serif"><br>
              &nbsp;&nbsp;1505. #read_data2.a_1505_a#</font></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1505_b#</font></strong></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1505_c#</font></strong></td>
          </tr>
		  <tr>
            <td><font size="2" face="Arial, Helvetica, sans-serif"><br>
              &nbsp;&nbsp;1506. #read_data2.a_1506_a#</font></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1506_b#</font></strong></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1506_c#</font></strong></td>
          </tr>
		  <tr>
            <td><font size="2" face="Arial, Helvetica, sans-serif"><br>
              &nbsp;&nbsp;1507. #read_data2.a_1507_a#</font></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1507_b#</font></strong></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1507_c#</font></strong></td>
          </tr>
		  <tr>
            <td><font size="2" face="Arial, Helvetica, sans-serif"><br>
              &nbsp;&nbsp;1508. #read_data2.a_1508_a#</font></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1508_b#</font></strong></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1508_c#</font></strong></td>
          </tr>
		  <tr>
            <td><font size="2" face="Arial, Helvetica, sans-serif"><br>
              &nbsp;&nbsp;1509. #read_data2.a_1509_a#</font></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1509_b#</font></strong></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1509_c#</font></strong></td>
          </tr>
		  <tr>
            <td><font size="2" face="Arial, Helvetica, sans-serif"><br>
              &nbsp;&nbsp;1510. #read_data2.a_1510_a#</font></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1510_b#</font></strong></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1510_c#</font></strong></td>
          </tr>
		  <tr>
            <td><font size="2" face="Arial, Helvetica, sans-serif"><br>
              &nbsp;&nbsp;1511. #read_data2.a_1511_a#</font></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1511_b#</font></strong></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1511_c#</font></strong></td>
          </tr>
		  <tr>
            <td><font size="2" face="Arial, Helvetica, sans-serif"><br>
              &nbsp;&nbsp;1512. #read_data2.a_1512_a#</font></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1512_b#</font></strong></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1512_c#</font></strong></td>
          </tr>
		  <tr>
            <td><font size="2" face="Arial, Helvetica, sans-serif"><br>
              &nbsp;&nbsp;1513. #read_data2.a_1513_a#</font></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1513_b#</font></strong></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1513_c#</font></strong></td>
          </tr>
		  <tr>
            <td><font size="2" face="Arial, Helvetica, sans-serif"><br>
              &nbsp;&nbsp;1514. #read_data2.a_1514_a#</font></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1514_b#</font></strong></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1514_c#</font></strong></td>
          </tr>
		  <tr>
            <td><font size="2" face="Arial, Helvetica, sans-serif"><br>
              &nbsp;&nbsp;1515. #read_data2.a_1515_a#</font></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1515_b#</font></strong></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1515_c#</font></strong></td>
          </tr>
		  <tr>
            <td><font size="2" face="Arial, Helvetica, sans-serif"><br>
              &nbsp;&nbsp;1516. #read_data2.a_1516_a#</font></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1516_b#</font></strong></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1516_c#</font></strong></td>
          </tr>
		  <tr>
            <td><font size="2" face="Arial, Helvetica, sans-serif"><br>
              &nbsp;&nbsp;1517. #read_data2.a_1517_a#</font></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1517_b#</font></strong></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1517_c#</font></strong></td>
          </tr>
		  <tr>
            <td><font size="2" face="Arial, Helvetica, sans-serif"><br>
              &nbsp;&nbsp;1518. #read_data2.a_1518_a#</font></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1518_b#</font></strong></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1518_c#</font></strong></td>
          </tr>
		  <tr>
            <td><font size="2" face="Arial, Helvetica, sans-serif"><br>
              &nbsp;&nbsp;1519. #read_data2.a_1519_a#</font></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1519_b#</font></strong></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1519_c#</font></strong></td>
          </tr>
		  <tr>
            <td><p>&nbsp;</p><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1520.
              TOTAL HUD LINE 1208 EXPENSE:</font></strong></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1520#</font></strong></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1520_b#</font></strong></td>
          </tr>

        </table>
</td></tr></table></cfif>

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
