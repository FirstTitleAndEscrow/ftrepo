<cfparam name="user_id_1" default="">
<cfparam name="lo_id" default="">



		<CFQUERY datasource="#request.dsn#" NAME="read_for_indicator">

			SELECT *
			FROM Tax_Cert_Title
			WHERE title_ID = #rec_ID#


		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_abstract">

			SELECT *
			FROM Doc_Abstract_Title
			WHERE title_ID = #rec_ID#


		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_current_Commitment_Clauses">
			SELECT *
			FROM Doc_Title_Insurance_Title
			WHERE Title_ID = #rec_ID#
		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="read_title_order">

			SELECT *
			FROM Title
			WHERE title_ID = #rec_ID#


		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="Read_Title_Order_Req">
				SELECT *
				FROM Title_Closing_Order_Request
				Where Title_Id = #rec_id#
			</CFQUERY>
			<CFQUERY datasource="#request.dsn#" NAME="Read_Title_Order_info">
				SELECT *
				FROM eventlist
				Where Title_Id = #rec_id#
			</CFQUERY>
			<CFQUERY datasource="#request.dsn#" NAME="Read_Title_Order_shipping">
				SELECT *
				FROM Shipping_info
				Where Id = #rec_id#
			</CFQUERY>
					<CFIF #Read_Title_Order_Req.a_sent_by# GT 0 AND #Read_Title_Order_Req.a_filled_out_by# GT 0>
						<CFSET A_Update_DB_Flag = 3>
					<CFELSE>
						<CFSET A_Update_DB_Flag = 0>
					</CFIF>


<CFQUERY datasource="#request.dsn#" NAME="read_appraisal">

			SELECT *
			FROM Appraisal_Doc_Title
			WHERE title_ID = #rec_ID#


		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="read_payoff_info_1">
			SELECT *
			FROM Pay_Off_Lender_1_Title
			WHERE Title_ID = #rec_ID#
		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_payoff_info_2">
			SELECT *
			FROM Pay_Off_Lender_2_Title
			WHERE Title_ID = #rec_ID#
		</CFQUERY>



		<CFQUERY datasource="#request.dsn#" NAME="read_current_Commitment_Clauses">
			SELECT *
			FROM Doc_Title_Insurance_Title
			WHERE Title_ID = #rec_ID#
		</CFQUERY>


		<CFQUERY datasource="#request.dsn#" NAME="read_title">

			SELECT *
			FROM Title
			WHERE title_ID = #rec_ID#


		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_sel_company">

			SELECT *
			FROM companies
			WHERE ID = #read_title.comp_ID#

		</CFQUERY>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>


<STYLE TYPE="text/css"><!--
		A { color:#0033CC; text-decoration:none}
		BODY { font-family:arial,helvetica; margin-left:0; margin-top:0; margin-right:0;}
		A:hover,A:active { text-decoration:underline}
		TD { font-family:arial,helvetica;}

	--></STYLE>
</head>

<BODY BGCOLOR="#ffffff" TEXT="#000000" LINK="#ff0000" VLINK="#800000" ALINK="#ff00ff" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth="0" MarginHeight="0">

<CENTER>
<CENTER>

		<table width="780" height="110" border="0" cellpadding="0" cellspacing="0" background="/client/images/banner_black_wout_logo.jpg" valign="top">
  <tbody><tr>
    <td rowspan="2" valign="top" width="220"> 
<a href="./"><img src="/client/images/FT_header_logo.jpg" border="0" alt="First Title Services Homepage" height="110" width="220"></a>
</td>
    <td valign="top" align="right"><br>


</td>
  </tr>
  <tr>
    <td valign="top" align="center" width="560"><nobr></nobr><br>
      &nbsp;</td>
  </tr>
</tbody></table>
<table width="780">
<tr>
<td>
<table WIDTH="672" CELLPADDING="0" CELLSPACING="0" BORDER="0" border="0">
<cfoutput><tr>
<!--- <td rowspan="2" VALIGN="Middle" width="210"><font face="arial,helvetica" color="white" size="2"><b>Borrower name: #read_title.bfirstname1#&nbsp;&nbsp;#read_title.blastname1#</b></font></td>
 ---><<td WIDTH="602" HEIGHT="37" ALIGN="Right" VALIGN="Middle"><span class="txt_mhsegname"><font face="arial,helvetica" color="white" size="2"><b><font face="arial,helvetica" color="white" size="2"><b> <a href="./title_tp_report_nav.cfm?id=#id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#&comp_id=#comp_id#"><font face="arial,helvetica" color="red" size="2">Back</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Borrower name: #read_title.bfirstname1#&nbsp;&nbsp;#read_title.blastname1#</b></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b><font face="arial,helvetica" color="white" size="2">Order number: #read_title.title_id#</font></b></span>
</td>
</tr></cfoutput>
</table></td></tr></table>



	<TR><td HEIGHT="16" VALIGN="Top">
<img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/masthead_subnavsep.gif" border="0" height="8" width="780" />
	</td>
</TR></td>
<!--- <TR><td align = "center" bgcolor= "d3d3d3" HEIGHT="16" VALIGN="Top"> usemap="#ss"width="595" height="596"

</td>
</TR> --->
<TR><td align = "center" HEIGHT="16" VALIGN="Top">



<cfparam name="a_trigger" default="0">
<cfif #a_trigger# eq 4>
<cfquery name="view" datasource="#request.dsn#">
select * FROM upload_many
where title_id = #url.rec_id# AND ID = #URL.ID#
</cfquery>
<cfquery name="view" datasource="#request.dsn#">
DELETE FROM upload_many
where title_id = #url.rec_id# AND ID = #URL.ID#
</cfquery>
<cfoutput>
<cflock timeout="30"
throwontimeout="No"
name="DeleteFile"
type="EXCLUSIVE">
<cffile action="DELETE"
file="c:\uploads\#view.fileupload#">
</cflock>
</cfoutput>




<cfquery name="view" datasource="#request.dsn#">
SELECT * FROM upload_many
where title_id = #url.rec_id#
ORDER BY ID
</cfquery>
<cfif view.recordcount eq 0>
<table>
<tr>
<td align="center">
<br><br>
<font class="pageheader"><b>No files found.</b></font>
</td>
</tr>
</table>
<cfelse>
      <table border="1" cellpadding="0" cellspacing="0">
        <tr>
<th>File Number<br><br></th>
<th>File Name<br><br></th>
<th>File Date<br><br></th>
<th>&nbsp;</th>
</tr>
<cfset i = 0>
<cfoutput query="view">
<cfset i = i + 1>
<form method="POST" action="./blob_list.cfm?id=#id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#&comp_id=#comp_id#&ID=#ID#&a_trigger=4" enctype="multipart/form-data">
<tr>
<td>#i#.</td>

<td><A HREF="#fileSys.FindFilePath('#view.fileupload#', 'url')#" target="new">#view.fileupload#</a></td>
<td>&nbsp;&nbsp;#FileDate#&nbsp;&nbsp;</td>
<td>
<input type=image src="./admin_area/images/button_delete.gif" border=0>

</td>
</tr></form>
</cfoutput>
</table>
</cfif>
<br><br>
<table>
<tr>
<td><cfoutput>
<a href="./add_blob.cfm?id=#id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#&comp_id=#comp_id#">[Add a new file]</a>&nbsp;&nbsp;
</td>
<td>


&nbsp;&nbsp;<a href="./blob_list.cfm?id=#id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#&comp_id=#comp_id#">[View existing files]</a>
</td></cfoutput>
</tr>
</table>
</div>
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
<cfelse>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>File Listing</title>
<link rel=stylesheet href="./css/defaults.css">
</head>
<body>
<div align="center">
<table align="center">
<tr>
<td  class="mainheader">File Listing</td>
</tr>
</table>
<br><br>

<cfquery name="view" datasource="#request.dsn#">
SELECT * FROM upload_many
where title_id = #url.rec_id#
ORDER BY ID
</cfquery>
<cfif view.recordcount eq 0>
<table>
<tr>
<td align="center">
<br><br>
<font class="pageheader"><b>No files found.</b></font>
</td>
</tr>
</table>
<cfelse>
<table border="1" cellspacing="0" cellpadding="0">
<tr>
<th>File Number<br><br></th>
<th>File Name<br><br></th>
<th>File Date<br><br></th>
<th>&nbsp;</th>
</tr>
<cfset i = 0>
<cfoutput query="view">
<cfset i = i + 1>
<form method="POST" action="./blob_list.cfm?id=#id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#&comp_id=#comp_id#&ID=#ID#&a_trigger=4" enctype="multipart/form-data">
<tr>
<td>#i#.</td>

<td><A HREF="#fileSys.FindFilePath('#view.fileupload#', 'url')#" target="new">#view.fileupload#</a></td>
<td>&nbsp;&nbsp;#FileDate#&nbsp;&nbsp;</td>
<td>
<input type=image src="./admin_area/images/button_delete.gif" border=0>

</td>
</tr></form>
</cfoutput>
</table>
</cfif>
<br><br>
<table>
<tr>
<td><cfoutput>
<a href="./add_blob.cfm?id=#id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#&comp_id=#comp_id#">[Add a new file]</a>&nbsp;&nbsp;
</td>
<td>


&nbsp;&nbsp;<a href="./blob_list.cfm?id=#id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#&comp_id=#comp_id#">[View existing files]</a>
</td></cfoutput>
</tr>
</table>
</div>

</cfif>


		</TD>
	</TR>


		</td>
	</tr><!--- ====================================================================== ---><!--- ====================================================================== ---><!--- ====================================================================== --->


	<tr>
		<td width=830 align=left valign=top bgcolor=e1e1el>
		<!--- <nobr><A href="javascript:window.close();"><IMG src="./images/button_close.gif" border=0></a></nobr>
 --->


			</td>


		</tr>



	</table>


			</td>
		</tr>

	</table></CENTER></CENTER>

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
