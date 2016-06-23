
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
			  <b> <A HREF="https://#cgi.server_name#/stend_client_view.cfm?rec_id=#rec_id#" target="new">view/print</a></B></font>

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
			  <b> <A HREF="https://#cgi.server_name#/stend_client_view2.cfm?rec_id=#rec_id#" target="new">view/print</a></B></font>

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
			  <b> <A HREF="https://#cgi.server_name#/stend_client_view3.cfm?rec_id=#rec_id#" target="new">view/print</a></B></font>

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
			  <b> <A HREF="https://#cgi.server_name#/stend_client_view4.cfm?rec_id=#rec_id#" target="new">view/print</a></B></font>

              </td>


		  </tr><cfelse>

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

		  </tr></cfif>










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

