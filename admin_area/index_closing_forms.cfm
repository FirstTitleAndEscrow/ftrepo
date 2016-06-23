
<CFPARAM NAME="a_flag" DEFAULT="">
<CFPARAM NAME="count" DEFAULT="">
<CFPARAM NAME="a_trigger" DEFAULT="">

<!--- <CFQUERY datasource="#request.dsn#" NAME="read_company">
SELECT *
FROM companies
WHERE id = '#comp_id#'
ORDER BY company ASC
</CFQUERY>

<cfif #read_company.recordcount# GT 0>--->
<CFQUERY datasource="#request.dsn#" NAME="getuser">
select * from first_admin

			WHERE ID = #session.ft_user_id#

</CFQUERY>
<!--- </cfif> --->

<CFQUERY datasource="#request.dsn#" NAME="read_titleid">

			SELECT *
			FROM title_closing_order_request
			where a_filled_out_date is null
			ORDER BY Title_id

		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_ins_committments">
			SELECT *
			FROM Doc_Title_Insurance_Title
			WHERE Title_ID = #rec_ID#
		</CFQUERY>
<html>
<head>
<title>		View
</title>
</head>

<body bgcolor="silver">
<div align="center">

  <table border="0" cellpadding="0" cellspacing="0" width="650" bgcolor="black">
    <tr>
      <td>
        <div align="center">

          <table border="1" cellpadding="1" cellspacing="0" width="650" bgcolor="white">
            <tr>
              <td bgcolor="navy" colspan="7" width="650">
                    <p align="center"><font color="white" face="Arial Black">
<!---Description Bar--->


			  </font></p>
              </td>
             </tr>



		   <tr>

              <td bgcolor="blue" colspan = 6 valign=center width="80%" align="center">
               <font size=3 color=white face=verdana><b>
		Check index below for Closing forms and Endorsements</b></font><br>
		  </td>


		  </tr>
		  <tr>


              <td bgcolor="white" colspan = 6 valign=center width="80%" align="center">

		  <font size=2 color=black face=verdana>

		 **Select form you wish to merge order information below


			  </td>


		  </tr>
	<cfoutput>

 <tr>
 <td bgcolor="elelel" valign=top width="20%" align="center">
             <font size=2 color=red face=verdana><b>
               Email/Modify file
        </b></font>
              </td>
			<td bgcolor="elelel" valign=top width="30%" align="center">
               <font size=2 color=red face=verdana><b>
               File Description
        </b></font>
              </td>
<td bgcolor="elelel" valign=top width="30%" align="center">
               <font size=2 color=red face=verdana><b>
              View/Print File
        </b></font>
              </td>
			  </tr>


     <tr>

              <td bgcolor="elelel" valign=center width="20%" align="center">
               <font size=1 color=black face=verdana>
			  <b> <a href="closing_forms.cfm?rec_id=#rec_id#" target="new">closing_forms.cfm</a></B></font>
              </td>
            <td bgcolor="elelel" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
           Closing Form
         </b>
              </td>
			   <td bgcolor="elelel" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
           <font size=1 color=black face=verdana>
			  <b> <A HREF="https://#cgi.server_name#/closing_forms_client_view.cfm?rec_id=#rec_id#" target="new">view/print</a></B></font>

              </td>


		  </tr>

		    <tr>

              <td bgcolor="elelel" valign=center width="20%" align="center">
               <font size=1 color=black face=verdana>
			  <b> <a href="RELEASE.cfm?rec_id=#rec_id#" target="new">release.cfm</a></B></font>
              </td>
            <td bgcolor="elelel" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
           Release Request Letter
         </b>
              </td>
			  <td bgcolor="elelel" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
             <font size=1 color=black face=verdana>
			  <b> <A HREF="https://#cgi.server_name#/RELEASE_client_view.cfm?rec_id=#rec_id#" target="new">view/print</a></B></font>

              </td>


		  </tr>

		   <cfif #read_ins_committments.insurance_co# eq "16">
		    <tr>

              <td bgcolor="elelel" valign=center width="20%" align="center">
               <font size=1 color=black face=verdana>
			  <b> <a href="stend.cfm?rec_id=#rec_id#" target="new">stend1.cfm</a></B></font>
              </td>
            <td bgcolor="elelel" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
          Stewart Title Letter 1
         </b>
              </td>
			   <td bgcolor="elelel" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
         <font size=1 color=black face=verdana>
			  <b> <A HREF="https://#cgi.server_name#/admin_area/stend_view.cfm?rec_id=#rec_id#" target="new">view/print</a></B></font>

              </td>


		  </tr>

		     <tr>

              <td bgcolor="elelel" valign=center width="20%" align="center">
               <font size=1 color=black face=verdana>
			  <b> <a href="stend2.cfm?rec_id=#rec_id#" target="new">stend2.cfm</a></B></font>
              </td>
            <td bgcolor="elelel" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
          Stewart Title Letter 2
         </b>
              </td>
			   <td bgcolor="elelel" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
         <font size=1 color=black face=verdana>
			  <b> <A HREF="https://#cgi.server_name#/admin_area/stend_view2.cfm?rec_id=#rec_id#" target="new">view/print</a></B></font>

              </td>


		  </tr>

		      <tr>

              <td bgcolor="elelel" valign=center width="20%" align="center">
               <font size=1 color=black face=verdana>
			  <b> <a href="stend3.cfm?rec_id=#rec_id#" target="new">stend3.cfm</a></B></font>
              </td>
            <td bgcolor="elelel" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
          Stewart Title Letter 3
         </b>
              </td>
			   <td bgcolor="elelel" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
         <font size=1 color=black face=verdana>
			  <b> <A HREF="https://#cgi.server_name#/admin_area/stend_view3.cfm?rec_id=#rec_id#" target="new">view/print</a></B></font>

              </td>


		  </tr>

		      <tr>

              <td bgcolor="elelel" valign=center width="20%" align="center">
               <font size=1 color=black face=verdana>
			  <b> <a href="stend4.cfm?rec_id=#rec_id#" target="new">stend4.cfm</a></B></font>
              </td>
            <td bgcolor="elelel" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
          Stewart Title Letter 4
         </b>
              </td>
			   <td bgcolor="elelel" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
         <font size=1 color=black face=verdana>
			  <b> <A HREF="https://#cgi.server_name#/admin_area/stend_view4.cfm?rec_id=#rec_id#" target="new">view/print</a></B></font>

              </td>


		  </tr>

		  		   <cfelseif #read_ins_committments.insurance_co# eq "25">
		    <tr>

              <td bgcolor="elelel" valign=center width="20%" align="center">
               <font size=1 color=black face=verdana>
			  <b> <a href="FAend.cfm?rec_id=#rec_id#" target="new">FAend1.cfm</a></B></font>
              </td>
            <td bgcolor="elelel" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
          First American Letter 1
         </b>
              </td>
			   <td bgcolor="elelel" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
         <font size=1 color=black face=verdana>
			  <b> <A HREF="https://#cgi.server_name#/admin_area/FAend_view.cfm?rec_id=#rec_id#" target="new">view/print</a></B></font>

              </td>


		  </tr>

		     <tr>

              <td bgcolor="elelel" valign=center width="20%" align="center">
               <font size=1 color=black face=verdana>
			  <b> <a href="FAend2.cfm?rec_id=#rec_id#" target="new">FAend2.cfm</a></B></font>
              </td>
            <td bgcolor="elelel" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
          First American Letter 2
         </b>
              </td>
			   <td bgcolor="elelel" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
         <font size=1 color=black face=verdana>
			  <b> <A HREF="https://#cgi.server_name#/admin_area/FAend_view2.cfm?rec_id=#rec_id#" target="new">view/print</a></B></font>

              </td>


		  </tr>

		      <tr>

              <td bgcolor="elelel" valign=center width="20%" align="center">
               <font size=1 color=black face=verdana>
			  <b> <a href="FAend3.cfm?rec_id=#rec_id#" target="new">FAend3.cfm</a></B></font>
              </td>
            <td bgcolor="elelel" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
          First American Letter 3
         </b>
              </td>
			   <td bgcolor="elelel" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
         <font size=1 color=black face=verdana>
			  <b> <A HREF="https://#cgi.server_name#/admin_area/FAend_view3.cfm?rec_id=#rec_id#" target="new">view/print</a></B></font>

              </td>


		  </tr>

		      <tr>

              <td bgcolor="elelel" valign=center width="20%" align="center">
               <font size=1 color=black face=verdana>
			  <b> <a href="FAend4.cfm?rec_id=#rec_id#" target="new">FAend4.cfm</a></B></font>
              </td>
            <td bgcolor="elelel" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
          First American Letter 4
         </b>
              </td>
			   <td bgcolor="elelel" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
         <font size=1 color=black face=verdana>
			  <b> <A HREF="https://#cgi.server_name#/admin_area/FAend_view4.cfm?rec_id=#rec_id#" target="new">view/print</a></B></font>

              </td>


		  </tr>
		  <cfelse>

    <tr>

              <td bgcolor="elelel" valign=center width="20%" align="center">
               <font size=1 color=black face=verdana>
			  <b> <a href="apend.cfm?rec_id=#rec_id#" target="new">apend1.cfm</a></B></font>
              </td>
            <td bgcolor="elelel" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
          American Pioneer Endorsement 1
         </b>
              </td>

			  <td bgcolor="elelel" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
          <font size=1 color=black face=verdana>
			  <b> <A HREF="https://#cgi.server_name#/apend_client_view.cfm?rec_id=#rec_id#" target="new">view/print</a></B></font>

         </b>
              </td>

		  </tr>

		     <tr>

              <td bgcolor="elelel" valign=center width="20%" align="center">
               <font size=1 color=black face=verdana>
			  <b> <a href="apend2.cfm?rec_id=#rec_id#" target="new">apend2.cfm</a></B></font>
              </td>
            <td bgcolor="elelel" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
          American Pioneer Endorsement 2
         </b>
              </td>

			  <td bgcolor="elelel" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
          <font size=1 color=black face=verdana>
			  <b> <A HREF="https://#cgi.server_name#/apend_client_view2.cfm?rec_id=#rec_id#" target="new">view/print</a></B></font>

         </b>
              </td>

		  </tr>

		    <tr>

              <td bgcolor="elelel" valign=center width="20%" align="center">
               <font size=1 color=black face=verdana>
			  <b> <a href="apend3.cfm?rec_id=#rec_id#" target="new">apend3.cfm</a></B></font>
              </td>
            <td bgcolor="elelel" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
          American Pioneer Endorsement 3
         </b>
              </td>

			  <td bgcolor="elelel" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
          <font size=1 color=black face=verdana>
			  <b> <A HREF="https://#cgi.server_name#/apend_client_view3.cfm?rec_id=#rec_id#" target="new">view/print</a></B></font>

         </b>
              </td>

		  </tr>

		    <tr>

              <td bgcolor="elelel" valign=center width="20%" align="center">
               <font size=1 color=black face=verdana>
			  <b> <a href="apend4.cfm?rec_id=#rec_id#" target="new">apend4.cfm</a></B></font>
              </td>
            <td bgcolor="elelel" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
          American Pioneer Endorsement 4
         </b>
              </td>

			  <td bgcolor="elelel" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
          <font size=1 color=black face=verdana>
			  <b> <A HREF="https://#cgi.server_name#/apend_client_view4.cfm?rec_id=#rec_id#" target="new">view/print</a></B></font>

         </b>
              </td>

		  </tr>






		  </cfif>






<tr>
	<td bgcolor="elelel" valign=center width="20%" align="center" colspan=3>
	<font size=1 color=black face=verdana>
	<b>New Web Forms</B></font>
	</td>
</tr>



<tr>
	<td bgcolor="elelel" valign=center width="20%" align="center">
	<font size=1 color=black face=verdana>
	<b> <a href="st_settlement_and_disclosure.cfm?rec_id=#rec_id#" target="new">st_settlement_and_disclosure.cfm</a></B></font>
	</td>
	<td bgcolor="elelel" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
	Streamline Settlement<br>
Agreement & Disclosure
	</b>
	</td>
	<td bgcolor="elelel" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
	<font size=1 color=black face=verdana>
	<b> <A HREF="https://#cgi.server_name#/st_settlement_client_view.cfm?rec_id=#rec_id#" target="new">view/print</a></B></font>
</td>


</tr>




<tr>
	<td bgcolor="elelel" valign=center width="20%" align="center">
	<font size=1 color=black face=verdana>
	<b> <a href="respa_disclosure.cfm?rec_id=#rec_id#" target="new">respa_disclosure.cfm</a></B></font>
	</td>
	<td bgcolor="elelel" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
	RESPA DISCLOSURE REGARDING<BR>AFFILIATED ENTITIES
	</b>
	</td>
	<td bgcolor="elelel" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
	<font size=1 color=black face=verdana>
	<b> <A HREF="https://#cgi.server_name#/respa_disclosure_client_view.cfm?rec_id=#rec_id#" target="new">view/print</a></B></font>
</td>
</tr>


<tr>
	<td bgcolor="elelel" valign=center width="20%" align="center">
	<font size=1 color=black face=verdana>
	<b> <a href="owners_affidavit.cfm?rec_id=#rec_id#" target="new">owners_affidavit.cfm</a></B></font>
	</td>
	<td bgcolor="elelel" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
	OWNER'S AFFIDAVIT AND<BR>
	ENHANCED OWNER'S POLICY

	</b>
	</td>
	<td bgcolor="elelel" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
	<font size=1 color=black face=verdana>
	<b> <A HREF="https://#cgi.server_name#/owners_affidavit_client_view.cfm?rec_id=#rec_id#" target="new">view/print</a></B></font>
</td>
</tr>





<tr>
	<td bgcolor="elelel" valign=center width="20%" align="center">
	<font size=1 color=black face=verdana>
	<b> <a href="Seller_rep_inst_VA.cfm?rec_id=#rec_id#" target="new">Seller_rep_inst_VA.cfm</a></B></font>
	</td>
	<td bgcolor="elelel" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
	Seller Rep Instructions VA

	</b>
	</td>
	<td bgcolor="elelel" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
	<font size=1 color=black face=verdana>
	<b> <A HREF="https://#cgi.server_name#/Seller_rep_inst_VA_client_view.cfm?rec_id=#rec_id#" target="new">view/print</a></B></font>
</td>
</tr>




<tr>
	<td bgcolor="elelel" valign=center width="20%" align="center">
	<font size=1 color=black face=verdana>
	<b> <a href="Seller_rep_inst_MD.cfm?rec_id=#rec_id#" target="new">Seller_rep_inst_MD.cfm</a></B></font>
	</td>
	<td bgcolor="elelel" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
	Seller Rep Instructions MD

	</b>
	</td>
	<td bgcolor="elelel" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
	<font size=1 color=black face=verdana>
	<b> <A HREF="https://#cgi.server_name#/Seller_rep_inst_MD_client_view.cfm?rec_id=#rec_id#" target="new">view/print</a></B></font>
</td>
</tr>









<tr>
	<td bgcolor="elelel" valign=center width="20%" align="center">
	<font size=1 color=black face=verdana>
	<b> <a href="FNMA_TC_wire_inst.cfm?rec_id=#rec_id#" target="new">FNMA_TC_wire_inst.cfm</a></B></font>
	</td>
	<td bgcolor="elelel" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
	FNMA TC<br>
Wire Instructions

	</b>
	</td>
	<td bgcolor="elelel" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
	<font size=1 color=black face=verdana>
	<b> <A HREF="https://#cgi.server_name#/FNMA_TC_wire_inst_client_view.cfm?rec_id=#rec_id#" target="new">view/print</a></B></font>
</td>
</tr>




<tr>
	<td bgcolor="elelel" valign=center width="20%" align="center">
	<font size=1 color=black face=verdana>
	<b> <a href="FNMA_tax_proration_agreement.cfm?rec_id=#rec_id#" target="new">FNMA_tax_proration_agreement.cfm</a></B></font>
	</td>
	<td bgcolor="elelel" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
	FNMA Tax Proration Agreement

	</b>
	</td>
	<td bgcolor="elelel" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
	<font size=1 color=black face=verdana>
	<b> <A HREF="https://#cgi.server_name#/FNMA_tax_proration_agreement_client_view.cfm?rec_id=#rec_id#" target="new">view/print</a></B></font>
</td>
</tr>





<tr>
	<td bgcolor="elelel" valign=center width="20%" align="center">
	<font size=1 color=black face=verdana>
	<b> <a href="FNMA_waiver.cfm?rec_id=#rec_id#" target="new">FNMA_waiver.cfm</a></B></font>
	</td>
	<td bgcolor="elelel" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
	FNMA Waiver and Release Agreement

	</b>
	</td>
	<td bgcolor="elelel" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
	<font size=1 color=black face=verdana>
	<b> <A HREF="https://#cgi.server_name#/FNMA_waiver_client_view.cfm?rec_id=#rec_id#" target="new">view/print</a></B></font>
</td>
</tr>




<tr>
	<td bgcolor="elelel" valign=center width="20%" align="center">
	<font size=1 color=black face=verdana>
	<b> <a href="FNMA_errors.cfm?rec_id=#rec_id#" target="new">FNMA_errors.cfm</a></B></font>
	</td>
	<td bgcolor="elelel" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
	FNMA Errors and Omissions Doc

	</b>
	</td>
	<td bgcolor="elelel" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
	<font size=1 color=black face=verdana>
	<b> <A HREF="https://#cgi.server_name#/FNMA_errors_client_view.cfm?rec_id=#rec_id#" target="new">view/print</a></B></font>
</td>
</tr>

<tr>
	<td bgcolor="elelel" valign=center width="20%" align="center">
	<font size=1 color=black face=verdana>
	<b> <a href="FNMA_TC.cfm?rec_id=#rec_id#" target="new">FNMA_TC.cfm</a></B></font>
	</td>
	<td bgcolor="elelel" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
	FNMA to TC<br>
Important Instructions

	</b>
	</td>
	<td bgcolor="elelel" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
	<font size=1 color=black face=verdana>
	<b> <A HREF="https://#cgi.server_name#/FNMA_TC_client_view.cfm?rec_id=#rec_id#" target="new">view/print</a></B></font>
</td>
</tr>



<tr>
	<td bgcolor="elelel" valign=center width="20%" align="center">
	<font size=1 color=black face=verdana>
	<b> <a href="FNMA_indemnification.cfm?rec_id=#rec_id#" target="new">FNMA_indemnification.cfm</a></B></font>
	</td>
	<td bgcolor="elelel" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
	AFFIDAVIT AND INDEMNIFICATION<br>
AS TO DEBTS AND LIENS

	</b>
	</td>
	<td bgcolor="elelel" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
	<font size=1 color=black face=verdana>
	<b> <A HREF="https://#cgi.server_name#/FNMA_indemnification_client_view.cfm?rec_id=#rec_id#" target="new">view/print</a></B></font>
</td>
</tr>





<tr>
	<td bgcolor="elelel" valign=center width="20%" align="center">
	<font size=1 color=black face=verdana>
	<b><a href="deed_creator_form.cfm?rec_id=#rec_id#&deed_id=3" target="new">FNMA_VA_deed.cfm</a></B></font>
	<!--- <b> <a href="FNMA_VA_deed.cfm?rec_id=#rec_id#" target="new">FNMA_VA_deed.cfm</a></B></font> --->
	</td>
	<td bgcolor="elelel" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
	FNMA VA DEED
	</b>
	</td>
	<td bgcolor="elelel" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
	<!---
	<font size=1 color=black face=verdana>
	<b> <A HREF="https://#cgi.server_name#/FNMA_VA_deed_client_view.cfm?rec_id=#rec_id#" target="new">view/print</a></B></font>
	--->
</td>
</tr>



<tr>
	<td bgcolor="elelel" valign=center width="20%" align="center">
	<font size=1 color=black face=verdana>
	<b><a href="deed_creator_form.cfm?rec_id=#rec_id#&deed_id=7" target="new">FNMA_MD_deed.cfm</a></B></font>
	<!--- <b> <a href="FNMA_MD_deed.cfm?rec_id=#rec_id#" target="new">FNMA_MD_deed.cfm</a></B></font> --->
	</td>
	<td bgcolor="elelel" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
	FNMA MD DEED
	</b>
	</td>
	<td bgcolor="elelel" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
	<!--- <font size=1 color=black face=verdana>
	<b> <A HREF="https://#cgi.server_name#/FNMA_MD_deed_client_view.cfm?rec_id=#rec_id#" target="new">view/print</a></B></font>
	--->
</td>
</tr>


<tr>
	<td bgcolor="elelel" valign=center width="20%" align="center">
	<font size=1 color=black face=verdana>
	<b><a href="COMBINED_CLOSING_FORMS.cfm?rec_id=#rec_id#" target="new">COMBINED_CLOSING_FORMS.cfm</a></B></font>
	</td>
	<td bgcolor="elelel" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
	COMBINED CLOSING FORMS

	</b>
	</td>
	<td bgcolor="elelel" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
	<font size=1 color=black face=verdana>
	<b> <A HREF="https://#cgi.server_name#/COMBINED_CLOSING_FORMS_client_view.cfm?rec_id=#rec_id#" target="new">view/print</a></B></font>
</td>
</tr>
<tr>
	<td bgcolor="elelel" valign=center width="20%" align="center">
	<font size=1 color=black face=verdana>
	<b><a href="FNMA_CLOSING_FORMS.cfm?rec_id=#rec_id#" target="new">FNMA_CLOSING_FORMS.cfm</a></B></font>
	</td>
	<td bgcolor="elelel" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
	FNMA VIRGINIA CLOSING FORMS

	</b>
	</td>
	<td bgcolor="elelel" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
	<font size=1 color=black face=verdana>
	<b> <A HREF="https://#cgi.server_name#/FNMA_CLOSING_FORMS_client_view.cfm?rec_id=#rec_id#" target="new">view/print</a></B></font>
</td>
</tr>
<tr>
	<td bgcolor="elelel" valign=center width="20%" align="center">
	<font size=1 color=black face=verdana>
	<b><a href="FNMA_CLOSING_FORMS.cfm?rec_id=#rec_id#&md=1" target="new">FNMA_CLOSING_FORMS.cfm</a></B></font>
	</td>
	<td bgcolor="elelel" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
	FNMA MD/DC CLOSING FORMS

	</b>
	</td>
	<td bgcolor="elelel" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
	<font size=1 color=black face=verdana>
	<b> <A HREF="https://#cgi.server_name#/FNMA_CLOSING_FORMS_client_view.cfm?rec_id=#rec_id#&md=1" target="new">view/print</a></B></font>
</td>
</tr>
<tr>
	<td bgcolor="elelel" valign=center width="20%" align="center">
	<font size=1 color=black face=verdana>
	<b><a href="freddie_CLOSING_FORMS.cfm?rec_id=#rec_id#" target="new">FREDDIE_CLOSING_FORMS.cfm</a></B></font>
	</td>
	<td bgcolor="elelel" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
	FREDDIE MAC CLOSING FORMS

	</b>
	</td>
	<td bgcolor="elelel" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
	<font size=1 color=black face=verdana>
	<b> <A HREF="https://#cgi.server_name#/FREDDIE_CLOSING_FORMS_client_view.cfm?rec_id=#rec_id#" target="new">view/print</a></B></font>
</td>
</tr>
<tr>
	<td bgcolor="elelel" valign=center width="20%" align="center">
	<font size=1 color=black face=verdana>
	<b><a href="vrm_CLOSING_FORMS.cfm?rec_id=#rec_id#" target="new">VRM_CLOSING_FORMS.cfm</a></B></font>
	</td>
	<td bgcolor="elelel" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
	VRM CLOSING FORMS

	</b>
	</td>
	<td bgcolor="elelel" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
	
</td>
</tr>
<tr>
	<td bgcolor="elelel" valign=center width="20%" align="center">
	<font size=1 color=black face=verdana>
	<b><a href="WELCOME_REALTOR.cfm?rec_id=#rec_id#" target="new">WELCOME_REALTOR.cfm</a></B></font>
	</td>
	<td bgcolor="elelel" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
	WELCOME REALTOR LETTER

	</b>
	</td>
	<td bgcolor="elelel" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
	<font size=1 color=black face=verdana>
	<b> <A HREF="https://#cgi.server_name#/WELCOME_REALTOR_client_view.cfm?rec_id=#rec_id#" target="new">view/print</a></B></font>
</td>
</tr>

<tr>
	<td bgcolor="elelel" valign=center width="20%" align="center" colspan=3>
	<font size=1 color=black face=verdana>
	<b>Newer Web Forms</B></font>
	</td>
</tr>
<tr>
	<td bgcolor="elelel" valign=center width="20%" align="center">
	<font size=1 color=black face=verdana>
	<b><a href="deed_creator_form.cfm?rec_id=#rec_id#" target="new">Deed Creator</a></B></font>
	</td>
	<td bgcolor="elelel" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
	DEED CREATOR version 1.1
	</b>
	</td>
	<td bgcolor="elelel" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
	<font size=1 color=black face=verdana>
	<b><a href="deed_creator_form.cfm?rec_id=#rec_id#" target="new">Deed Creator</a></B></font>
</td>
</tr>
<tr>
	<td bgcolor="elelel" valign=center width="20%" align="center">
	<font size=1 color=black face=verdana>
	<b><a href="vrm_cover.cfm?rec_id=#rec_id#" target="new">VRM Cover Sheet</a></B></font>
	</td>
	<td bgcolor="elelel" valign=center width="30%" align="center"> <font size=1 color=black face=verdana><b>
	VRM Cover Sheet
	</b>
	</td>
	<td bgcolor="elelel" valign=center width="30%" align="center">
		<font size=1 color=black face=verdana>
	<b> <A HREF="https://#cgi.server_name#/vrm_cover_client_view.cfm?rec_id=#rec_id#" target="new">view/print</a></B></font>
</td>
</tr>

          	</cfoutput>
     </table>





			 </td>







		</tr>
        </table>
        </div>

      </td>
    </tr>
  </table>
 </body>
</html>

