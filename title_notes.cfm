
<CFPARAM NAME="a_direction" DEFAULT="">
<CFPARAM NAME="Insurance_Company" DEFAULT="">
<CFPARAM NAME="Title_Ins_Co_Is" DEFAULT="0">
<CFPARAM NAME="A_Update_DB_Flag" DEFAULT="0">
<CFPARAM NAME="N_Note_1" DEFAULT="0">






		<!--- ===/ If the A_Update_DB_Flag is GT 0   \=== --->
		<!--- ===/ then we need to update the proper \=== --->
		<!--- ===/ Table with the data from the form \=== --->



		<CFIF #A_Update_DB_Flag# GT "0">



<CFQUERY datasource="#request.dsn#" NAME="read_uder_info">
SELECT *
FROM users
WHERE a_user = '#USER_ID_1#'
</CFQUERY>




		</CFIF>


	<!--- Read all of the Notes for this title --->

			<CFQUERY datasource="#request.dsn#" NAME="read_all_notes">
				SELECT *
				FROM Title_Notes
				Where Order_Id = #rec_id#
				ORDER BY Note_ID ASC
			</CFQUERY>





<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>
</head>

<BODY BGCOLOR="e1e1e1" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER>
<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=790 align=center valign=top>

<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
			<td width=790 align=left valign=top bgcolor=green>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Title Notes</B></CENTER>
			</TD>
		</TR>
	<tr>
		<td width=790 align=center valign=top bgcolor=e1e1e1>

		<CFINCLUDE TEMPLATE="./includes/title_top_navu.cfm">
		<p>

<table width=700 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>


		<tr>
			<td width=700  align=right valign=top bgcolor=e1e1e1>
<CFOUTPUT QUERY="Read_all_notes">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=black>
						#N_Date#
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=black>
						#N_Time#
					</td>
					<td width=125 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=black>
						#fname# #lname#
					</td>
				<tr>
			</table>

		<td width=444 align=left valign=top bgcolor=e1e1e1>
			<PRE><font face=verdana size=1 color=black>#N_Note#</PRE>
		</td>
	</tr>
</table>

</CFOUTPUT>


<p>


<p>


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


