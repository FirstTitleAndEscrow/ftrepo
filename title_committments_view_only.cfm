
<CFPARAM NAME="a_direction" DEFAULT="">
<CFPARAM NAME="Insurance_Company" DEFAULT="">



		<CFQUERY datasource="#request.dsn#" NAME="read_Title">

			SELECT *
			FROM Title
			WHERE Title_ID = #rec_ID#

		</CFQUERY>


			<CFSET a_proposed_insured_1 = #read_Title.bfirstname1# & " " & #read_Title.bminame1# & " " & #read_Title.blastname1# >
			<CFSET a_proposed_insured_2 = #read_Title.bfirstname2# & " " & #read_Title.bminame2# & " " & #read_Title.blastname2# >


			<CFSET Buyer_1 = #read_Title.bfirstname1# & " " & #read_Title.bminame1# & " " & #read_Title.blastname1#>

			<CFSET Buyer_2 = #read_Title.bfirstname2# & " " & #read_Title.bminame2# & " " & #read_Title.blastname2#>

			<CFSET Seller_1 = #read_Title.sfirstname1# & " " & #read_Title.sminame1# & " " & #read_Title.slastname1#>

			<CFSET Seller_2 = #read_Title.sfirstname2# & " " & #read_Title.sminame2# & " " & #read_Title.slastname2#>



		<CFQUERY datasource="#request.dsn#" NAME="read_sel_company">

			SELECT *
			FROM companies
			WHERE ID = #read_Title.comp_ID#

		</CFQUERY>



		<CFQUERY datasource="#request.dsn#" NAME="read_ins_committments">
			SELECT *
			FROM Doc_Title_Insurance_Title
			WHERE Title_ID = #rec_ID#
		</CFQUERY>




<CFSET a_PolicyViewTemplate	= "Title_Committment_View_Amer_Pioneer_Ins_All.cfm">




<CFIF #read_ins_committments.insurance_co# GT ""
				OR #read_ins_committments.insurance_co# GT "0" >

			<CFQUERY datasource="#request.dsn#" NAME="Read_Committment_Doc">
				SELECT *
				FROM #read_ins_committments.a_DB_To_Use#
				WHERE Title_ID = #rec_ID#
			</CFQUERY>

		</CFIF>


	<CFIF #read_ins_committments.Insurance_Co# GT "">

		<CFQUERY datasource="#request.dsn#" NAME="read_Title_FT_Agency_company">

			SELECT *
			FROM Title_FT_Agencies
			WHERE Title_FT_Agency_ID = #read_ins_committments.Insurance_Co#

		</CFQUERY>

		<CFSET a_read_Title_FT_Agency_company = #read_Title_FT_Agency_company.recordcount#>

	<CFELSE>

		<CFSET a_read_Title_FT_Agency_company = 0>

	</CFIF>

		<CFQUERY datasource="#request.dsn#" NAME="read_existing_committments">
			SELECT *
			FROM Title_Committment_Clauses_Selected_Title
			WHERE Title_ID = #rec_ID#
			ORDER BY committment_Item_Order ASC
		</CFQUERY>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>
</head>

<BODY BGCOLOR="white" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER>
<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td width=790 align=center valign=top>

<table width=701 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=701  align=right valign=top bgcolor=e1e1e1>

<table width=700 cellpadding=1 cellspacing=1 border=0 bgcolor=white>

	<tr>
		<td width=700 align=left valign=top bgcolor=white>
			<font size=2 color=black face=arial>
			<CFINCLUDE TEMPLATE="#read_ins_committments.a_PolicyViewTemplate#">
		</TD>
	</TR>
</table>
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->

			</td>
		</tr>
	</table>
			</TD>
		</TR>
	</table>
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
</HTML>